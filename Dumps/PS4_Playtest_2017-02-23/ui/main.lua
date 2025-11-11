require( "ui.uieditor.menus.Core_UI_require" )

if CoD.isPC then
	require( "ui.uieditor.menus.core_ui_pc_require" )
end
if LUI.DEV ~= nil then
	require( "ui.uieditor.menus.core_dev_require" )
end
DataSources.InitControllerModelsAndSubscriptions()
if CoD.isFrontend then
	require( "ui.utility.lobbymenus" )
	require( "ui.uieditor.menus.Core_Frontend_require" )
	LUI.createMenu.main = function ()
		local maxControllers = Engine.GetMaxControllerCount()
		for i = 0, maxControllers - 1, 1 do
			Engine.LockInput( i, true )
			Engine.SetUIActive( i, true )
		end
		CoD.StartLiveEventFromData( {
			liveEventStreamerIndex = Dvar.currentLiveEvent:get()
		} )
		local i = CoD.Menu.NewForUIEditor( "main" )
		i:setLeftRight( true, true, 0, 0 )
		i:setTopBottom( true, true, 0, 0 )
		i.anyChildUsesUpdateState = true
		Engine.Exec( nil, "checkforinvites" )
		i:setPriority( 9999 )
		local mapVoteModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote", true )
		Engine.CreateModel( mapVoteModel, "mapVoteMapNext", true )
		local f1_local1 = function ( mainMenu, controller )
			mainMenu.toastNotification = CoD.ToastNotification.new( mainMenu, controller )
			mainMenu.toastNotification:setState( "DefaultState" )
			mainMenu:addElement( mainMenu.toastNotification )
			mainMenu._spinner = CoD.Spinner.new( mainMenu, controller )
			mainMenu:addElement( mainMenu._spinner )
			if CoD.MatchStartWarning then
				mainMenu.matchStartWarning = CoD.MatchStartWarning.new( mainMenu, controller )
				mainMenu.matchStartWarning:setLeftRight( true, true, 0, 0 )
				mainMenu:addElement( mainMenu.matchStartWarning )
				mainMenu.matchStartWarning:processEvent( {
					name = "update_state",
					menu = mainMenu,
					controller = controller
				} )
			end
			local LoadingScreenPreloadHidden = LUI.UIImage.new()
			LoadingScreenPreloadHidden:setAlpha( 0 )
			LoadingScreenPreloadHidden:setupUIStreamedImage( 0 )
			LoadingScreenPreloadHidden:subscribeToGlobalModel( controller, "MapVote", "mapVoteMapNext", function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue then
					LoadingScreenPreloadHidden:setImage( RegisterImage( MapNameToMapLoadingImage( controller, modelValue ) ) )
				end
			end )
			mainMenu:addElement( LoadingScreenPreloadHidden )
			mainMenu.LoadingScreenPreloadHidden = LoadingScreenPreloadHidden
			
			if IsLuaCodeVersionAtLeast( 25 ) and Engine.UsingFreeCursor() then
				mainMenu.freeCursor = LUI.createMenu.FreeCursor( controller )
				mainMenu.freeCursor:setPriority( 1000 )
				mainMenu:addElement( mainMenu.freeCursor )
			end
		end
		
		local controller = Engine.GetPrimaryController()
		f1_local1( i, controller )
		i:registerEventHandler( "refresh_dw_inventory_menu", function ( element, event )
			local maxControllers = Engine.GetMaxControllerCount()
			for i = 0, maxControllers - 1, 1 do
				DataSources.CryptoKeyProgress.getModel( i )
				DataSources.MegaChewTokens.getModel( i )
			end
		end )
		i:registerEventHandler( "debug_reload", function ( self, event )
			if self.toastNotification ~= nil then
				self.toastNotification:close()
				self.toastNotification = nil
			end
			if i.matchStartWarning ~= nil then
				i.matchStartWarning:close()
				i.matchStartWarning = nil
			end
			if self.LoadingScreenPreloadHidden ~= nil then
				self.LoadingScreenPreloadHidden:close()
				self.LoadingScreenPreloadHidden = nil
			end
			if self.freeCursor then
				self.freeCursor:close()
				self.freeCursor = nil
			end
			self:removeAllChildren()
			f1_local1( i, controller )
		end )
		LUI.OverrideFunction_CallOriginalSecond( i, "close", function ( self )
			self.toastNotification:close()
		end )
		return i
	end
	
else
	require( "ui.uieditor.menus.OverlaySystem.SystemOverlay_MessageDialog" )
	require( "ui.uieditor.menus.OverlaySystem.SystemOverlay_NoBG" )
	local HUD_OpenInGameMenu, HUD_SetupEventHandlers, HUD_UpdateKillcam, HUD_ForceKillKillstreakHUD, HUD_UpdateLocationSelector, HUD_UpdateKillcamInfoDataModels, MATCH_TYPE_FFA = nil
	local ScoreboardPriority = 10
	local HUD_IngameMenuOpen = nil
	local HUD_DelayLoadMenusLoaded = false
	EnableGlobals()
	function HUD_IngameMenuClosed()
		HUD_IngameMenuOpen = nil
	end
	
	local HUD_DelayLoadMenus = function ()
		if HUD_DelayLoadMenusLoaded then
			return 
		end
		HUD_DelayLoadMenusLoaded = true
		if CoD.isCampaign then
			require( "ui.uieditor.menus.hud.HUD_CP_require" )
			require( "ui.uieditor.widgets.Reticles.RocketLaunchers.rocketLauncherReticle" )
			if Engine.GetCurrentMap() == "cp_mi_eth_prologue" then
				require( "ui.uieditor.menus.CPLevels.Prologue.SecurityCamera" )
				require( "ui.uieditor.menus.SpinnerFullscreenBlack" )
			elseif Engine.GetCurrentMap() == "cp_mi_zurich_coalescence" then
				require( "ui.uieditor.menus.SpinnerFullscreenBlack" )
			end
		elseif CoD.isZombie then
			require( "ui.uieditor.menus.hud.HUD_ZM_require" )
			require( "ui.uieditor.widgets.Reticles.Magnifier.MagnifierReticle_UI3D" )
			require( "ui.uieditor.widgets.Demo.Demo" )
			if Engine.GetCurrentMap() == "zm_zod" then
				require( "ui.uieditor.menus.hud.zm_zod_require" )
				require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )
				require( "ui.uieditor.widgets.HUD.ZM_TimeBar.ZM_BeastmodeTimeBarWidget" )
				require( "ui.uieditor.widgets.ZMInventory.FuseBox.FuseWidget" )
				require( "ui.uieditor.widgets.ZMInventory.InventoryWidget" )
				require( "ui.uieditor.widgets.ZMInventory.Ritual.RitualItem" )
				require( "ui.uieditor.widgets.ZMInventory.Ritual.RitualWidget" )
			elseif Engine.GetCurrentMap() == "zm_factory" then
				require( "ui.uieditor.menus.hud.zm_factory_require" )
				require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )
			elseif Engine.GetCurrentMap() == "zm_castle" then
				require( "ui.uieditor.menus.hud.T7Hud_zm_castle" )
				require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )
			elseif Engine.GetCurrentMap() == "zm_island" then
				require( "ui.uieditor.menus.hud.T7Hud_zm_island" )
				require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )
			else
				require( "ui.uieditor.menus.hud.T7Hud_zm_factory" )
				require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )
			end
		else
			require( "ui.uieditor.menus.hud.HUD_MP_require" )
			require( "ui.uieditor.widgets.MPHudWidgets.CodCaster.CodCaster" )
			require( "ui.uieditor.widgets.Demo.Demo" )
			require( "ui.uieditor.widgets.Reticles.RocketLaunchers.rocketLauncherReticle" )
		end
	end
	
	if CoD.isCampaign or Engine.GetCurrentMap() == "zm_zod" then
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
	
	local HUD_VehicleConfig_GetIntParam = function ( vehicleDef, configIndex )
		return vehicleDef["hudConditionIntParam" .. configIndex]
	end
	
	local HUD_VehicleConfigConditions = {
		IsVehicleOwner = function ( controller, vehicleDef, configIndex )
			local f12_local0 = Engine.GetModelForController( controller )
			return f12_local0.vehicle.isVehicleOwner:get()
		end,
		IsAttackMode = function ( controller, vehicleDef, configIndex )
			local f13_local0 = Engine.GetModelForController( controller )
			local attackMode = f13_local0.vehicle.vehicleAttackMode:get()
			return attackMode == HUD_VehicleConfig_GetIntParam( vehicleDef, configIndex )
		end
	}
	local f0_local0 = {}
	local f0_local1 = createVehicleTypeMap
	local f0_local2 = "VehicleHUD_DPS"
	local f0_local3 = {}
	local f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
	local f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	local f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack" )
	local f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local0.spawner_enemy_54i_vehicle_quadtank_cannon_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local0.spawner_enemy_54i_vehicle_quadtank_mlrs_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Sentinel"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_DETONATE", "+attack", "right" )
	f0_local0.spawner_enemy_54i_vehicle_raps_suicide_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Sentinel"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	local f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f0_local0.spawner_enemy_54i_vehicle_wasp_mg_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Sentinel"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
	f0_local0.spawner_enemy_54i_vehicle_wasp_rocket_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattacksecond" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
	f0_local0.spawner_enemy_54i_vehicle_pamws_minigun_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
	f0_local0.spawner_enemy_54i_vehicle_amws_minigun_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+attack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local0.spawner_enemy_54i_vehicle_siegebot_minigun_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+gostand" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown" )
	local f0_local9 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup" )
	f0_local0.spawner_enemy_54i_vehicle_hunter_rocket_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local0.spawner_enemy_nrc_vehicle_quadtank_cannon_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local0.spawner_enemy_nrc_vehicle_quadtank_mlrs_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Sentinel"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_DETONATE", "+attack", "right" )
	f0_local0.spawner_enemy_nrc_vehicle_raps_suicide_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Sentinel"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f0_local0.spawner_enemy_nrc_vehicle_wasp_mg_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Sentinel"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
	f0_local0.spawner_enemy_nrc_vehicle_wasp_rocket_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattacksecond" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
	f0_local0.spawner_enemy_nrc_vehicle_pamws_minigun_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
	f0_local0.spawner_enemy_nrc_vehicle_amws_minigun_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+attack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local0.spawner_enemy_nrc_vehicle_siegebot_minigun_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+gostand" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown" )
	f0_local9 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup" )
	f0_local0.spawner_enemy_nrc_vehicle_hunter_rocket_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local0.spawner_enemy_sec_vehicle_quadtank_cannon_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local0.spawner_enemy_sec_vehicle_quadtank_mlrs_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Sentinel"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_DETONATE", "+attack", "right" )
	f0_local0.spawner_enemy_sec_vehicle_raps_suicide_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Sentinel"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f0_local0.spawner_enemy_sec_vehicle_wasp_mg_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Sentinel"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
	f0_local0.spawner_enemy_sec_vehicle_wasp_rocket_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattacksecond" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
	f0_local0.spawner_enemy_sec_vehicle_pamws_minigun_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
	f0_local0.spawner_enemy_sec_vehicle_amws_minigun_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+attack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local0.spawner_enemy_sec_vehicle_siegebot_minigun_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+gostand" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown" )
	f0_local9 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup" )
	f0_local0.spawner_enemy_sec_vehicle_hunter_rocket_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Sentinel"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f0_local0.spawner_ally_ega_vehicle_wasp_mg_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
	f0_local0.spawner_ally_ega_vehicle_amws_minigun_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_VTOL"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattacksecond", "right" )
	f0_local0.veh_bo3_mil_vtol_fighter_player_agile = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_VTOL"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattacksecond", "right" )
	f0_local0.veh_bo3_mil_vtol_fighter_player_dogfight = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_VTOL"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattacksecond", "right" )
	f0_local0.veh_bo3_mil_vtol_fighter_player_dogfight_slow = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_VTOL"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattacksecond", "right" )
	f0_local0.veh_bo3_mil_vtol_fighter_convoy_assault_air = f0_local1( f0_local2, f0_local4 )
	f0_local1 = {}
	f0_local2 = {
		condition = function ( controller )
			local f14_local0 = Engine.GetModelForController( controller )
			local attackMode = f14_local0.vehicle.vehicleAttackMode:get()
			return attackMode == 1
		end
	}
	f0_local3 = createVehicleTypeMap
	f0_local4 = "VHUD_MS"
	f0_local5 = {}
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SWITCH_WEAPON", "+weapnext_inventory", "left" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local9 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "right" )
	local f0_local10 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_NAPALM", "+vehicleattack", "right" )
	f0_local2.hud = f0_local3( f0_local4, f0_local6 )
	f0_local3 = {}
	f0_local4 = createVehicleTypeMap
	f0_local5 = "VHUD_MS"
	f0_local6 = {}
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SWITCH_WEAPON", "+weapnext_inventory", "left" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local9 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local10 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "right" )
	local f0_local11 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
	f0_local3.hud = f0_local4( f0_local5, f0_local7 )
	f0_local1[1] = f0_local2
	f0_local1[2] = f0_local3
	f0_local0.veh_bo3_mil_vtol_convoy_assault_air_player = f0_local1
	f0_local1 = {}
	f0_local2 = {
		condition = function ( controller )
			local f15_local0 = Engine.GetModelForController( controller )
			local attackMode = f15_local0.vehicle.vehicleAttackMode:get()
			return attackMode == 1
		end
	}
	f0_local3 = createVehicleTypeMap
	f0_local4 = "VehicleHUD_VTOL"
	f0_local5 = {}
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SWITCH_WEAPON", "+weapnext_inventory", "left" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SPEEDBOOST", "+breath_sprint", "left" )
	f0_local9 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "right" )
	f0_local10 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
	f0_local2.hud = f0_local3( f0_local4, f0_local6 )
	f0_local3 = {}
	f0_local4 = createVehicleTypeMap
	f0_local5 = "VehicleHUD_VTOL"
	f0_local6 = {}
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SWITCH_WEAPON", "+weapnext_inventory", "left" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local9 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SPEEDBOOST", "+breath_sprint", "left" )
	f0_local10 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "right" )
	f0_local11 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f0_local3.hud = f0_local4( f0_local5, f0_local7 )
	f0_local1[1] = f0_local2
	f0_local1[2] = f0_local3
	f0_local0.veh_bo3_mil_vtol_fighter = f0_local1
	f0_local1 = {}
	f0_local2 = {
		condition = function ( controller )
			local f16_local0 = Engine.GetModelForController( controller )
			local attackMode = f16_local0.vehicle.vehicleAttackMode:get()
			return attackMode == 1
		end
	}
	f0_local3 = createVehicleTypeMap
	f0_local4 = "VehicleHUD_VTOL"
	f0_local5 = {}
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SWITCH_WEAPON", "+weapnext_inventory", "left" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SPEEDBOOST", "+breath_sprint", "left" )
	f0_local9 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "right" )
	f0_local10 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
	f0_local2.hud = f0_local3( f0_local4, f0_local6 )
	f0_local3 = {}
	f0_local4 = createVehicleTypeMap
	f0_local5 = "VehicleHUD_VTOL"
	f0_local6 = {}
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SWITCH_WEAPON", "+weapnext_inventory", "left" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local9 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SPEEDBOOST", "+breath_sprint", "left" )
	f0_local10 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "right" )
	f0_local11 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f0_local3.hud = f0_local4( f0_local5, f0_local7 )
	f0_local1[1] = f0_local2
	f0_local1[2] = f0_local3
	f0_local0.veh_bo4_player_air_vehicle1 = f0_local1
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
	f0_local0.veh_bo3_dlc_mil_hemtt_rocket_convoy = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f0_local0.veh_bo3_dlc_mil_hemtt_minigun_convoy = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f0_local0.veh_bo3_turret_dead_system_convoy_assault_air = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
	f0_local0.veh_bo3_dlc_mil_hemtt_tv_guided_convoy = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
	f0_local0.spawner_boct_team3_amws_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
	f0_local0.spawner_boct_team3_hunter_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Sentinel"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f0_local0.spawner_boct_team3_wasp_mg_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Sentinel"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
	f0_local0.spawner_boct_team3_wasp_rocket_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond", "right" )
	f0_local0.spawner_enemy_nrc_vehicle_quadtank_cannon_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f0_local0.veh_bo3_turret_auto_ceiling_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f0_local0.veh_bo3_turret_auto_sentry_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f0_local0.veh_bo3_turret_auto_sentry_sniper_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f0_local0.veh_bo3_turret_player = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f0_local0.veh_bo3_turret_hyperion = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f0_local0.veh_bo3_turret_player_inaccurate = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f0_local0.veh_bo3_turret_sniper = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f0_local0.veh_bo3_turret_mobile_wall_left = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f0_local0.veh_bo3_turret_mobile_wall_right = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VehicleHUD_DPS"
	f0_local3 = {}
	f0_local0.veh_bo3_turret_floodlight = f0_local1( f0_local2, createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" ) )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Turret"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f0_local0.sentry_turret = f0_local1( f0_local2, f0_local4, {
		red = 208,
		green = 192,
		blue = 129
	} )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Sentinel"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f0_local0.veh_sentinel_player_mp = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_AGR"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_TOGGLE", "+gostand", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond", "right" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
	f0_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f0_local0.spawner_bo3_ai_tank_mp_player = f0_local1( f0_local2, f0_local4, {
		red = 112,
		green = 255,
		blue = 113
	} )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Dart"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SLOW", "+speed_throw", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_STEER", "+lookstick", "left" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f0_local0.veh_dart_mp = f0_local1( f0_local2, f0_local4, {
		red = 208,
		green = 192,
		blue = 129
	} )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Hellstorm"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SLOW", "+speed_throw", "left" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SPEEDBOOST", "+breath_sprint", "left" )
	f0_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_CLUSTERBOMB", "+attack", "right" )
	f0_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_STEER", "+lookstick", "right" )
	f0_local0.operating_predator = f0_local1( f0_local2, f0_local4 )
	f0_local1 = createVehicleTypeMap
	f0_local2 = "VHUD_Hellstorm"
	f0_local3 = {}
	f0_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_DETONATE", "+attack", "right" )
	f0_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_STEER", "+lookstick", "right" )
	f0_local0.operating_tv_guided_missile = f0_local1( f0_local2, f0_local4 )
	f0_local1 = function ( self, controller, vehicleType )
		local vehicleInfo = Engine.GetVehicleBundleInfo( vehicleType )
		if vehicleInfo and vehicleInfo.vehicleConfigurations > 0 then
			local configuration = 1
			for f17_local0 = vehicleInfo.vehicleConfigurations, 2, -1 do
				local configCondition = vehicleInfo["hudCondition" .. f17_local0]
				if HUD_VehicleConfigConditions[configCondition] and HUD_VehicleConfigConditions[configCondition]( controller, vehicleInfo, f17_local0 ) then
					configuration = f17_local0
					break
				end
			end
			local prompts = {}
			local promptCount = vehicleInfo["vehicleHudButtonBindingCount" .. configuration]
			for i = 1, promptCount, 1 do
				table.insert( prompts, createVehicleButtonInfo( vehicleInfo["vehicleHud" .. configuration .. "BindingString" .. i], vehicleInfo["vehicleHud" .. configuration .. "BindingPrompt" .. i], vehicleInfo["vehicleHud" .. configuration .. "BindingPCDirection" .. i] ) )
			end
			return createVehicleTypeMap( vehicleInfo["vehicleHud" .. configuration], prompts )
		else
			local f17_local5 = f0_local0[vehicleType]
			if not f17_local5 then
				local hudInfo = {
					hudName = vehicleType
				}
			end
			if f17_local5 and not f17_local5.hudName then
				local hudTable = nil
				for _, item in ipairs( f17_local5 ) do
					if not item.condition or item.condition( controller ) then
						hudTable = item
						break
					end
				end
				if not hudTable or not hudTable.hud or not hudTable.hud.hudName then
					return nil
				end
				f17_local5 = hudTable.hud
			end
			return f17_local5
		end
	end
	
	f0_local2 = function ( self, controller, vehicleType, recreateExistingHud )
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
		elseif Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) then
			return 
		end
		local hudInfo = f0_local1( self, controller, vehicleType )
		if not hudInfo then
			return 
		end
		local menuCreationFunction = LUI.createMenu[hudInfo.hudName]
		if menuCreationFunction then
			DataSources.VehicleInfo.setButtonModels( controller, hudInfo.bindings, hudInfo.bindingColor )
			self.vehicleHUD = menuCreationFunction( controller )
			self.vehicleHUD:setPriority( -10 )
			self.vehicleHUD.vehicleType = vehicleType
			self.vehicleHUD:setLeftRight( 0, 1, 0, 0 )
			self.vehicleHUD:setTopBottom( 0, 1, 0, 0 )
			local f18_local0 = self.vehicleHUD
			local f18_local1 = f18_local0
			f18_local0 = f18_local0.setModel
			local f18_local2 = Engine.GetModelForController( controller )
			f18_local0( f18_local1, f18_local2.vehicle )
			LUI.OverrideFunction_CallOriginalSecond( self.vehicleHUD, "close", function ( element )
				if element == self.vehicleHUD then
					self.vehicleHUD = nil
				end
			end )
			self:addForceClosedChild( self.vehicleHUD )
			if hudInfo.hudName == "VHUD_Dart" or hudInfo.hudName == "VHUD_Sentinel" or hudInfo.hudName == "VHUD_AGR" or hudInfo.hudName == "VHUD_HCXD" or hudInfo.hudName == "VHUD_Turret" or hudInfo.hudName == "VHUD_MS" or hudInfo.hudName == "VHUD_MS_Gunner" or hudInfo.hudName == "VehicleHUD_DPS" then
				self.vehicleHUD:processEvent( {
					name = "menu_opened",
					controller = controller
				} )
			else
				self.vehicleHUD:sizeToSafeArea( controller )
			end
		end
	end
	
	f0_local3 = function ( self, controller )
		local visible = true
		if IsCampaign() then
			local isInTrainingSim = false
			local safehouseModel = Engine.GetModel( Engine.GetModelForController( controller ), "safehouse" )
			if safehouseModel then
				isInTrainingSim = CoD.SafeGetModelValue( safehouseModel, "inTrainingSim" ) == 1
			end
		end
		local vehicleModel = Engine.GetModel( Engine.GetModelForController( controller ), "vehicle" )
		if vehicleModel then
			local vehicleType = CoD.SafeGetModelValue( vehicleModel, "vehicleType" )
			if vehicleType == "killcamVehicle" then
				visible = false
			end
		end
		if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) then
			visible = false
		end
		self.reticleVisible = visible
		if self.reticle then
			self.reticle:setAlpha( self.reticleVisible and 1 or 0 )
		end
	end
	
	f0_local4 = function ( self, controller, reticleWidget, recreateExistingReticle )
		if self.reticle then
			if recreateExistingReticle then
				reticleWidget = self.reticle.reticleType
			end
			if self.reticle.reticleType == reticleWidget and not recreateExistingReticle then
				return 
			end
			self.reticle:close()
			self.reticle = nil
		end
		if reticleWidget and reticleWidget ~= "" and CoD[reticleWidget] and CoD[reticleWidget].new then
			self.reticle = CoD[reticleWidget].new( self, controller )
			self.reticle.reticleType = reticleWidget
			self.reticle:processEvent( {
				name = "update_state",
				menu = self
			} )
			self.reticle:setPriority( -100 )
			self.reticle:setAlpha( self.reticleVisible and 1 or 0 )
			LUI.OverrideFunction_CallOriginalSecond( self.reticle, "close", function ( element )
				if element == self.reticle then
					self.reticle = nil
				end
			end )
			self:addForceClosedChild( self.reticle )
		end
		f0_local3( self, controller )
	end
	
	f0_local5 = function ( self, controller, lockOnWidget )
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
		local HUD = CoD.Menu.NewFromState( "HUD", controller, 0, 1, 0, 0, 0, 1, 0, 0 )
		if not CoD.isCampaign and Engine.GetCurrentMap() ~= "zm_zod" then
			if CoD.isZombie then
				HUD_DelayLoadMenus()
			else
				HUD:registerEventHandler( "delay_load_menus", HUD_DelayLoadMenus )
			end
		end
		HUD:addElement( LUI.UITimer.new( 3000, "delay_load_menus", true ) )
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
		if CoD.isPC then
			Engine.Exec( controller, "ui_keyboard_cancel" )
			Engine.SetForceMouseRootFull( false )
		end
		Engine.PlayMenuMusic( "" )
		if controller == 0 then
			if not CoD.isCampaign or not "Loading_CP" then
				local f24_local0 = CoD.isZombie
				local f24_local1 = "Loading_ZM"
				local menuName = "Loading_MP"
			end
			HUD.loadingMenu = LUI.createMenu[f24_local0 and f24_local1 or REG14]( controller )
			HUD:addForceClosedChild( HUD.loadingMenu )
		end
		HUD:setAlpha( 1 )
		return HUD
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
	
	f0_local7 = function ( self, event )
		Engine.SetActiveMenu( event.controller, Enum.uiMenuCommand_t.UIMENU_NONE )
		self:processEvent( {
			name = "close_scoreboard_menu",
			controller = self:getOwner()
		} )
	end
	
	f0_local8 = function ( self, event )
		local isError = event.isError
		local gamertag = event.gamertag
		if isError == false then
			CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "MENU_INVITE_SENT" ), gamertag, LuaDefine.INVITE_TOAST_POPUP_ICON )
		else
			CoD.OverlayUtility.ShowToast( "Invite", Engine.ToUpper( Engine.Localize( "MENU_INVITE_FAILED" ) ), gamertag, LuaDefine.INVITE_TOAST_POPUP_ERROR_ICON )
		end
		return true
	end
	
	function HUD_SetupEventHandlers_Common( self )
		self:registerEventHandler( "first_snapshot", HUD_FirstSnapshot )
		self:registerEventHandler( "open_ingame_menu", HUD_OpenInGameMenu )
		self:registerEventHandler( "close_ingame_menu", HUD_CloseInGameMenu )
		self:registerEventHandler( "open_scoreboard_menu", HUD_OpenScoreBoard )
		self:registerEventHandler( "close_scoreboard_menu", HUD_CloseScoreBoard )
		self:registerEventHandler( "open_toaster_popup", f0_local8 )
		self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( self.controller ), "scriptNotify" ), function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue == "show_outcome" then
				local event = {
					controller = self.controller,
					name = modelValue,
					data = CoD.GetScriptNotifyData( model )
				}
				f0_local7( self, event )
			elseif modelValue == "track_victim_death" then
				local event = {
					controller = self.controller,
					name = modelValue,
					data = CoD.GetScriptNotifyData( model )
				}
				HUD_UpdateKillcamInfoDataModels( self, event )
			elseif modelValue == "force_scoreboard" then
				if Engine.IsDemoPlaying() == false or CoD.isZombie == false then
					local forceScoreboardValue = 1
					if CoD.isZombie == true then
						local data = CoD.GetScriptNotifyData( model )
						if data ~= nil then
							forceScoreboardValue = data[1]
						end
					end
					local forceScoreboardModel = Engine.CreateModel( Engine.GetModelForController( self.controller ), "forceScoreboard" )
					Engine.SetModelValue( forceScoreboardModel, forceScoreboardValue )
				end
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
		if controller == nil then
			controller = Engine.GetPrimaryController()
		end
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
				f0_local2( self, controller, modelValue, false )
				f0_local3( self, controller )
			end
		end )
		self:subscribeToGlobalModel( controller, "PerController", "forceUpdateVehicleBindings", function ( model )
			if self.vehicleHUD then
				f0_local2( self, controller, self.vehicleHUD.vehicleType, true )
			end
		end )
		if CoD.isCampaign then
			Engine.CreateModel( perControllerModel, "vehicle.vehicleAttackMode" )
			self:subscribeToGlobalModel( controller, "PerController", "vehicle.vehicleAttackMode", function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue and self.vehicleHUD then
					local hudInfo = f0_local1( self, controller, self.vehicleHUD.vehicleType )
					if hudInfo then
						DataSources.VehicleInfo.setButtonModels( controller, hudInfo.bindings, hudInfo.bindingColor )
						self.vehicleHUD:setModel( nil )
						local f42_local0 = self.vehicleHUD
						local f42_local1 = f42_local0
						f42_local0 = f42_local0.setModel
						local f42_local2 = Engine.GetModelForController( controller )
						f42_local0( f42_local1, f42_local2.vehicle )
					end
				end
			end )
		end
		self.reticleVisible = true
		self:subscribeToGlobalModel( controller, "PerController", "currentWeapon.weaponReticle", function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f0_local4( self, controller, modelValue, false )
			end
		end )
		self:subscribeToGlobalModel( controller, "PerController", "currentWeapon.lockOnWidget", function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f0_local5( self, controller, modelValue )
			end
		end )
		CoD.DemoUtility.RegisterEventHandlers( self, controller )
		if Engine.IsDemoPlaying() then
			self:subscribeToGlobalModel( controller, "Demo", "cameraMode", function ( model )
				local currentVehicleHud = CoD.SafeGetModelValue( DataSources.PerController.getModel( controller ), "vehicle.vehicleType" )
				f0_local2( self, controller, currentVehicleHud, true )
				f0_local3( self, controller )
			end )
		end
	end
	
	function HUD_SetupEventHandlers_Multiplayer( self )
		self:registerEventHandler( "hud_force_kill_killstreak_hud", HUD_ForceKillKillstreakHUD )
		local controller = self:getOwner()
		if controller == nil then
			controller = Engine.GetPrimaryController()
		end
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
		local forceScoreboardModel = Engine.CreateModel( Engine.GetModelForController( controller ), "forceScoreboard" )
		Engine.SetModelValue( forceScoreboardModel, 0 )
		self:subscribeToModel( forceScoreboardModel, function ( model )
			if Engine.GetModelValue( model ) > 0 then
				self:processEvent( {
					name = "open_scoreboard_menu",
					controller = controller
				} )
			else
				self:processEvent( {
					name = "close_scoreboard_menu",
					controller = controller
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
		if Engine.UsingFreeCursor() then
			self.freeCursor = LUI.createMenu.FreeCursor( self.controller )
			self.freeCursor:setPriority( 1000 )
			f50_local0 = self:getParent()
			f50_local0:addElement( self.freeCursor )
		end
		HUD_FirstSnapshot_Common( self, event )
		if false == CoD.isZombie then
			HUD_FirstSnapshot_Multiplayer( self, event )
			if CoD.isCampaign == true then
				HUD_FirstSnapshot_Campaign( self, event )
			end
		else
			self:dispatchEventToRoot( {
				name = "close_menu",
				menuName = "StartMenu_Main",
				controller = event.controller
			} )
			local forceScoreboardModel = Engine.CreateModel( Engine.GetModelForController( event.controller ), "forceScoreboard" )
			Engine.SetModelValue( forceScoreboardModel, 0 )
			HUD_FirstSnapshot_Zombie( self, event )
		end
		Engine.ForceHUDRefresh( event.controller )
		HUD_UpdateRefresh( self, event )
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
		local menu = LUI.createMenu.Migration( event.controller, self )
		self:addElement( menu )
	end
	
	function HUD_FirstSnapshot_Common( self, event )
		if not CoD.isMultiplayer then
			self.cinematicSubtitles = CoD.MovieSubtitles.new( self, event.controller )
			self.cinematicSubtitles:setLeftRight( false, false, -640, 640 )
			self.cinematicSubtitles:setTopBottom( false, false, -360, 360 )
			self:addElement( self.cinematicSubtitles )
		end
		local controller = event.controller
		HUD_AddHintTextElements( self, controller )
		local safeArea = CoD.Menu.NewFromState( "hud_safearea" )
		safeArea:sizeToSafeArea( controller )
		safeArea:setPriority( 100 )
		safeArea:setOwner( event.controller )
		self:addElement( safeArea )
		if self.safeArea and self.safeArea.buttonModel then
			if LUI.DEV then
				local modelsAreDifferent = LUI.DEV.ErrorIfModelsDoNotMatch( self.safeArea.buttonModel, Engine.CreateModel( Engine.GetModelForController( controller ), "HUDSafeArea.buttonPrompts" ) )
			end
			Engine.UnsubscribeAndFreeModel( self.safeArea.buttonModel )
			self.safeArea:close()
		end
		self.safeArea = safeArea
		self.safeArea.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "HUDSafeArea.buttonPrompts" )
		if CoD.isZombie == true then
			CoD.Zombie.SoloQuestMode = false
			local playerCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
			if playerCount == 1 and (CoD.isOnlineGame() == false or Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL ) == false) then
				CoD.Zombie.SoloQuestMode = true
			end
			if Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_DEFAULT ) == true and playerCount > 2 then
				CoD.Zombie.LocalSplitscreenMultiplePlayers = true
			end
		end
		HUD_CloseScoreBoard( self, event )
		if Dvar.ui_gametype:get() ~= "fr" and not CoD.ShowNewScoreboard() then
			self.scoreBoard = LUI.createMenu.Scoreboard( event.controller )
			self.scoreboardUpdateTimer = LUI.UITimer.new( 1000, {
				name = "update_scoreboard",
				controller = event.controller
			}, false )
		end
	end
	
	function HUD_AddHintTextElements( self, controller )
		local perControllerModel = Engine.GetModelForController( controller )
		local colorBlindModel = Engine.GetModel( perControllerModel, "profile.colorblindMode" )
		if Dvar.ui_gametype:get() == "codfu" then
			return 
		elseif Dvar.ui_gametype:get() == "doa" then
			return 
		end
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
		targetHighlights_Enemy:setRGB( CoD.ColorUtility.ExplodeColor( CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "EnemyScorestreakTarget" ) ) )
		self:addForceClosedChild( targetHighlights_Enemy )
		targetHighlights_Enemy:setupTargetHighlights_Enemy()
		if colorBlindModel then
			targetHighlights_Enemy:subscribeToModel( colorBlindModel, function ( model )
				targetHighlights_Enemy:setRGB( CoD.ColorUtility.ExplodeColor( CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "EnemyScorestreakTarget" ) ) )
			end, false )
		end
		local targetHighlightsLOS_Enemy = LUI.UIElement.new()
		targetHighlightsLOS_Enemy:setLeftRight( true, true, 0, 0 )
		targetHighlightsLOS_Enemy:setTopBottom( true, true, 0, 0 )
		targetHighlightsLOS_Enemy:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
		targetHighlightsLOS_Enemy:setRGB( CoD.ColorUtility.ExplodeColor( CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "EnemyScorestreakTarget" ) ) )
		self:addForceClosedChild( targetHighlightsLOS_Enemy )
		targetHighlightsLOS_Enemy:setupPlayerTargetHighlightsLineOfSight_Enemy()
		if colorBlindModel then
			targetHighlightsLOS_Enemy:subscribeToModel( colorBlindModel, function ( model )
				targetHighlightsLOS_Enemy:setRGB( CoD.ColorUtility.ExplodeColor( CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "EnemyScorestreakTarget" ) ) )
			end, false )
		end
		local targetHighlights_Friendly1 = LUI.UIElement.new()
		targetHighlights_Friendly1:setLeftRight( true, true, 0, 0 )
		targetHighlights_Friendly1:setTopBottom( true, true, 0, 0 )
		targetHighlights_Friendly1:setImage( RegisterMaterial( "compassping_enemy_diamond_bottom" ) )
		targetHighlights_Friendly1:setRGB( CoD.ColorUtility.ExplodeColor( CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "PlayerYellow" ) ) )
		self:addForceClosedChild( targetHighlights_Friendly1 )
		targetHighlights_Friendly1:setupTargetHighlights_Friendly()
		if colorBlindModel then
			targetHighlights_Friendly1:subscribeToModel( colorBlindModel, function ( model )
				local f56_local0 = IsMultiplayer()
				local f56_local1 = "PlayerYellow"
				local color = "PlayerGreen"
				targetHighlights_Friendly1:setRGB( CoD.ColorUtility.ExplodeColor( CoD.ColorUtility.GetColorBlindColorForPlayer( controller, f56_local0 and f56_local1 or color ) ) )
			end, false )
		end
		local targetHighlights_Friendly2 = LUI.UIElement.new()
		targetHighlights_Friendly2:setLeftRight( true, true, 0, 0 )
		targetHighlights_Friendly2:setTopBottom( true, true, 0, 0 )
		targetHighlights_Friendly2:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
		targetHighlights_Friendly2:setRGB( CoD.ColorUtility.ExplodeColor( CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "PlayerYellow" ) ) )
		self:addForceClosedChild( targetHighlights_Friendly2 )
		targetHighlights_Friendly2:setupTargetHighlights_Friendly()
		if colorBlindModel then
			targetHighlights_Friendly2:subscribeToModel( colorBlindModel, function ( model )
				local f57_local0 = IsMultiplayer()
				local f57_local1 = "PlayerYellow"
				local color = "PlayerGreen"
				targetHighlights_Friendly2:setRGB( CoD.ColorUtility.ExplodeColor( CoD.ColorUtility.GetColorBlindColorForPlayer( controller, f57_local0 and f57_local1 or color ) ) )
			end, false )
		end
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
		lockonTargetting:setRGB( CoD.ColorUtility.ExplodeColor( CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "EnemyScorestreakTarget" ) ) )
		self:addForceClosedChild( lockonTargetting )
		lockonTargetting:setupLockonHighlights()
		if colorBlindModel then
			lockonTargetting:subscribeToModel( colorBlindModel, function ( model )
				lockonTargetting:setRGB( CoD.ColorUtility.ExplodeColor( CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "EnemyScorestreakTarget" ) ) )
			end, false )
		end
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
	
	f0_local9 = function ( self, controller )
		if Engine.IsDemoPlaying() then
			return 
		else
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
						if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
							self.safeArea.CodCaster:processEvent( {
								name = "gain_focus",
								controller = controller
							} )
							self.safeArea.CodCaster:gainFocus( {
								controller = controller
							} )
						end
						if self.safeArea.PostCodCasterLoad then
							self.safeArea.PostCodCasterLoad( self.safeArea.CodCaster )
							self.safeArea.PostCodCasterLoad = nil
						end
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
	end
	
	function HUD_FirstSnapshot_Multiplayer( self, event )
		CoD.CodCasterUtility.SetupUIModels( event.controller )
		HUD_DelayLoadMenus()
		self.toastNotification = CoD.ToastNotification.new( self, event.controller )
		self.toastNotification:setState( "DefaultState" )
		self.toastNotification:setPriority( 9999 )
		local parent = self:getParent()
		if parent then
			parent:addElement( self.toastNotification )
		end
		local playerSpawnedModel = Engine.GetModelForController( event.controller )
		if playerSpawnedModel then
			playerSpawnedModel = Engine.GetModel( playerSpawnedModel, "hudItems.playerSpawned" )
		end
		local f62_local0 = playerSpawnedModel
		local playerSpawnedValue = Engine.GetModelValue( playerSpawnedModel )
		local f62_local1 = f62_local0 and playerSpawnedValue
		if f62_local1 then
			Engine.SetModelValue( playerSpawnedModel, false )
		end
		if self.T7HudMenu then
			self.T7HudMenu.SafeAreaContainerBack.Notifications.NotificationQueueWidget:clearNotificationQueue()
			self.T7HudMenu.hasBooted = false
			self.T7HudMenu:setAlpha( 1 )
			if self.T7HudMenu.PrematchCountdown then
				self.T7HudMenu.PrematchCountdown:close()
			end
		elseif Dvar.ui_gametype:get() ~= "doa" and Dvar.ui_gametype:get() ~= "codfu" then
			local T7HudMenu = nil
			T7HudMenu = LUI.createMenu.Hud( event.controller )
			if self.bootOnOpen then
				self.bootOnOpen = false
				TryBootHUD( T7HudMenu, 0 )
			end
			self.T7HudMenu = T7HudMenu
		end
		if self.T7HudMenu then
			self:addElement( self.T7HudMenu )
		end
		if self.T7HudMenu then
			if self.positionDraftSub then
				self:removeSubscription( self.positionDraftSub )
			end
			local f62_local2 = self
			local f62_local3 = self.subscribeToModel
			local f62_local4 = Engine.GetModelForController( event.controller )
			self.positionDraftSub = f62_local3( f62_local2, f62_local4:create( "PositionDraft.stage" ), function ( model )
				if model then
					local element = self
					local modelValue = model:get()
					if modelValue ~= nil and modelValue > 0 then
						CreatePrematchDraft( self.T7HudMenu, event.controller )
					end
				end
			end )
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
			require( "ui.uieditor.menus.hud.cp_doa_require" )
			gameModeName = "DOA"
		end
		if Dvar.ui_gametype:get() == "fr" then
			gameModeName = "FR"
		end
		if not self.T7HudMenuGameMode then
			local T7HudMenuGameMode = nil
			T7HudMenuGameMode = LUI.createMenu["Hud_" .. gameModeName]( event.controller )
			if gameModeName == "CP" then
				T7HudMenuGameMode:sizeToSafeArea( event.controller )
				if not self.InGameTalkersWidget then
					local InGameTalkersWidget = CoD.InGameTalkersWidget.new( T7HudMenuGameMode, event.controller )
					if IsCPAndInSafehouse() then
						InGameTalkersWidget:setLeftRight( false, true, -213, -23 )
						InGameTalkersWidget:setTopBottom( false, true, -123, -36 )
					else
						InGameTalkersWidget:setLeftRight( true, false, 64, 254 )
						InGameTalkersWidget:setTopBottom( true, false, 36, 123 )
					end
					self:addElement( InGameTalkersWidget )
					self.InGameTalkersWidget = InGameTalkersWidget
				end
			end
			if f62_local1 then
				Engine.SetModelValue( playerSpawnedModel, true )
			end
			self.T7HudMenuGameMode = T7HudMenuGameMode
		else
			self.T7HudMenuGameMode:setAlpha( 1 )
			if self.T7HudMenuGameMode.Outcome then
				self.T7HudMenuGameMode.Outcome:setAlpha( 0 )
			end
			if f62_local1 then
				Engine.SetModelValue( playerSpawnedModel, true )
			end
		end
		self:addElement( self.T7HudMenuGameMode )
		self:setAlpha( 1 )
		f0_local9( self, event.controller )
		CoD.DemoUtility.AddHUDWidgets( self, event )
		LuaUtils.MessageDialogForceSubscriptionFire()
	end
	
	function HUD_FirstSnapshot_Campaign( self, event )
		if Engine.GetCurrentMap() == "cp_mi_cairo_aquifer" then
			require( "ui.uieditor.menus.CPLevels.Aquifer.HackUploadHUD" )
			require( "ui.uieditor.menus.CPLevels.Aquifer.SecurityCameraOverlay" )
		end
		local f64_local0 = DataSources.HUDItems.getModel( event.controller )
		f64_local0 = f64_local0:create( "vehicleHack.mode" )
		f64_local0:set( 0 )
		f64_local0 = DataSources.HUDItems.getModel( event.controller )
		f64_local0 = f64_local0:create( "vehicleHack.level" )
		f64_local0:set( 0 )
		if self._vehicleHackModeSubscription then
			self:removeSubscription( self._vehicleHackModeSubscription )
		end
		self._vehicleHackModeSubscription = self:subscribeToGlobalModel( event.controller, "HUDItems", "vehicleHack.mode", function ( model )
			local mode = model:get() or 0
			if self.vehicleHack and mode == 0 then
				self.vehicleHack:close()
				self.vehicleHack = nil
			elseif not self.vehicleHack and mode ~= 0 then
				self.vehicleHack = CoD.vehicleHack.new( self, event.controller )
				self.vehicleHack.mode = mode
				self.vehicleHack:processEvent( {
					name = "update_state",
					menu = self
				} )
				LUI.OverrideFunction_CallOriginalSecond( self.vehicleHack, "close", function ()
					self.vehicleHack = nil
				end )
				self:addForceClosedChild( self.vehicleHack )
			elseif self.vehicleHack and self.vehicleHack.mode ~= mode then
				CoD.CPUtility.SetupVehicleHack( self.vehicleHack, event.controller )
			end
		end )
		if self._spinnerPuzzleSubscription then
			self:removeSubscription( self._spinnerPuzzleSubscription )
		end
		self._spinnerPuzzleSubscription = self:subscribeToGlobalModel( event.controller, "SpinnerPuzzle", "active", function ( model )
			if model:get() and not self.spinnerPuzzle then
				self.spinnerPuzzle = CoD.spinnersPuzzle.new( self, self.controller )
				self.spinnerPuzzle:processEvent( {
					name = "update_state",
					menu = self
				} )
				LUI.OverrideFunction_CallOriginalSecond( self.spinnerPuzzle, "close", function ()
					self.spinnerPuzzle = nil
				end )
				self:addForceClosedChild( self.spinnerPuzzle )
			elseif not model:get() and self.spinnerPuzzle then
				self.spinnerPuzzle:close()
				self.spinnerPuzzle = nil
			end
		end )
	end
	
	function HUD_FirstSnapshot_Zombie( self, event )
		local zombieHudContainer = LUI.UIElement.new()
		zombieHudContainer:setLeftRight( true, true, 0, 0 )
		zombieHudContainer:setTopBottom( true, true, 0, 0 )
		zombieHudContainer:sizeToSafeArea( event.controller )
		self:addForceClosedChild( zombieHudContainer )
		if CoD.Zombie.IsDLCMap( CoD.Zombie.DLC3Maps ) then
			zombieHudContainer:registerEventHandler( "time_bomb_hud_toggle", HUD_ToggleZombieHudContainer )
		end
		HUD_DelayLoadMenus()
		if self.T7HudMenuGameMode == nil then
			local map = Engine.GetCurrentMap()
			local f69_local0 = LUI.createMenu
			local f69_local1
			if map == "zm_zod" then
				f69_local1 = "T7Hud_ZM"
				if not f69_local1 then
				
				else
					local zmCreateMenuFunc = f69_local0[f69_local1]
					if zmCreateMenuFunc then
						self.T7HudMenuGameMode = zmCreateMenuFunc( event.controller )
					else
						self.T7HudMenuGameMode = LUI.createMenu.T7Hud_zm_factory( event.controller )
					end
				end
			end
			f69_local1 = "T7Hud_" .. map
		else
			self.T7HudMenuGameMode:setAlpha( 1 )
			local playerSpawnedModel = Engine.GetModelForController( event.controller )
			if playerSpawnedModel then
				playerSpawnedModel = Engine.GetModel( playerSpawnedModel, "hudItems.playerSpawned" )
			end
			local f69_local2 = playerSpawnedModel
			local playerSpawnedValue = Engine.GetModelValue( playerSpawnedModel )
			if f69_local2 and playerSpawnedValue then
				Engine.SetModelValue( playerSpawnedModel, true )
			end
		end
		self:addElement( self.T7HudMenuGameMode )
		
		local powerupsArea = LUI.createMenu.PowerUpsArea( event.controller )
		zombieHudContainer:addElement( powerupsArea )
		zombieHudContainer.powerupsArea = powerupsArea
		
		LUI.OverrideFunction_CallOriginalSecond( zombieHudContainer, "close", function ( self )
			self.powerupsArea:close()
		end )
		CoD.DemoUtility.AddHUDWidgets( self, event )
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
	
	function HasAnyChildWithID( self, testId )
		local child = self:getFirstChild()
		while child ~= nil do
			if child.id == testId then
				return true
			end
			child = child:getNextSibling()
		end
		return false
	end
	
	HUD_OpenInGameMenu = function ( self, event )
		if not self.firstSnapshotProcessed then
			if not self.pendingInGameMenuEvents then
				self.pendingInGameMenuEvents = {}
			end
			table.insert( self.pendingInGameMenuEvents, event )
			return 
		elseif event.menuName == "DOA_INGAME_PAUSE" and CoD.isDOAPauseMenuOpen ~= nil and CoD.isDOAPauseMenuOpen == true then
			return 
		elseif event.menuName == "StartMenu_Main" then
			if Engine.IsMigrating( event.controller ) == true then
				return 
			end
			local parent = self:getParent()
			if parent ~= nil and HasAnyChildWithID( parent, "Menu.StartMenu_Main" ) then
				return 
			end
		end
		if Engine.CanPauseGame() then
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
			if event.menuName == "ChooseClass_InGame" or event.menuName == "PositionDraft" then
				self:dispatchEventToRoot( {
					name = "close_menu",
					menuName = event.menuName,
					controller = event.controller
				} )
			end
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
		if self.safeArea and self.safeArea.buttonModel then
			if LUI.DEV then
				local modelsAreDifferent = LUI.DEV.ErrorIfModelsDoNotMatch( self.safeArea.buttonModel, Engine.CreateModel( Engine.GetModelForController( controller ), "HUDSafeArea.buttonPrompts" ) )
			end
			Engine.UnsubscribeAndFreeModel( self.safeArea.buttonModel )
		end
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
			Engine.SetActiveMenu( event.controller, Enum.uiMenuCommand_t.UIMENU_NONE )
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
			if self.scoreBoard:getParent() == self then
				self:removeElement( self.scoreBoard )
			end
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
		local currentVehicleHud = CoD.SafeGetModelValue( DataSources.PerController.getModel( event.controller ), "vehicle.vehicleType" )
		if currentVehicleHud then
			f0_local2( self, event.controller, currentVehicleHud, true )
		end
		local currentReticle = CoD.SafeGetModelValue( DataSources.PerController.getModel( event.controller ), "currentWeapon.weaponReticle" )
		if currentReticle then
			f0_local4( self, event.controller, currentReticle, true )
		end
		HUD_UpdateLocationSelector( self, event )
		HUD_UpdateKillcam( self, event )
	end
	
	function HUD_FullscreenStart( self, event )
		if self.scoreBoard and not CoD.ShowNewScoreboard() then
			self.scoreBoard:processEvent( event )
		end
		self:dispatchEventToChildren( event )
	end
	
	function HUD_FullscreenStop( self, event )
		if self.scoreBoard and not CoD.ShowNewScoreboard() then
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
		if self.T7HudMenu and not self.killcamHUD then
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
		local f90_local0
		if Engine.IsSplitscreen() == false then
			if Engine.IsDemoShoutcaster() ~= true then
				f90_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT )
				if f90_local0 then
					f90_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
					if f90_local0 then
						if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
							f90_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
						else
							f90_local0 = false
						end
					end
				end
			else
				f90_local0 = true
			end
		else
			f90_local0 = false
		end
		return f90_local0
	end
	
	f0_local11 = function ( controller )
		return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING )
	end
	
	if not CoD.isZombie and not CoD.isCampaign then
		require( "ui.uieditor.widgets.Tablet.TabletLocationSelector" )
	end
	HUD_UpdateLocationSelector = function ( self, event )
		if f0_local11( event.controller ) then
			if self.newLocationSelectorMap == nil then
				self.newLocationSelectorMap = CoD.TabletLocationSelector.new( self, event.controller )
				self.newLocationSelectorMap:processEvent( {
					name = "update_state",
					menu = self
				} )
				LUI.OverrideFunction_CallOriginalSecond( self.newLocationSelectorMap, "close", function ()
					self.newLocationSelectorMap = nil
				end )
				self:addForceClosedChild( self.newLocationSelectorMap )
			end
		elseif self.newLocationSelectorMap ~= nil then
			self.newLocationSelectorMap:close()
			self.newLocationSelectorMap = nil
		end
	end
	
	HUD_ForceKillKillstreakHUD = function ( self, event )
		if self ~= nil then
			local owner = self:getOwner()
			if owner ~= nil then
				Engine.DisableSceneFilter( owner, 4 )
			end
		end
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
				local gameModeGroup = Engine.GetDvarString( "ui_zm_gamemodegroup" )
				local f96_local0
				if gameModeGroup ~= CoD.Zombie.GAMETYPEGROUP_ZCLASSIC and gameModeGroup ~= CoD.Zombie.GAMETYPEGROUP_ZSURVIVAL then
					f96_local0 = false
				else
					f96_local0 = true
				end
				MATCH_TYPE_FFA = f96_local0
			else
				local f96_local1
				if Engine.GetDvarString( "ui_gametype" ) ~= "dm" and Engine.GetDvarString( "ui_gametype" ) ~= "hcdm" and Engine.GetDvarString( "ui_gametype" ) ~= "hack" then
					f96_local1 = false
				else
					f96_local1 = true
				end
				MATCH_TYPE_FFA = f96_local1
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
	
end
DisableGlobals()
Engine.StopEditingPresetClass()
