-- 6860d9c6180e213e9dd26e2ea9327bd3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.onOffImage" )
require( "ui.uieditor.widgets.HUD.ZM_Perks.ZMPerksContainerFactory" )
require( "ui.uieditor.widgets.HUD.ZM_RoundWidget.ZmRndContainer" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmoContainerFactory" )
require( "ui.uieditor.widgets.HUD.ZM_Score.ZMScr" )
require( "ui.uieditor.widgets.DynamicContainerWidget" )
require( "ui.uieditor.widgets.Notifications.Notification" )
require( "ui.uieditor.widgets.HUD.ZM_NotifFactory.ZmNotifBGB_ContainerFactory" )
require( "ui.uieditor.widgets.HUD.Waypoint.GenericWaypointContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.WaypointBase" )
require( "ui.uieditor.widgets.HUD.ZM_CursorHint.ZMCursorHint" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsole" )
require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate" )
require( "ui.uieditor.widgets.MPHudWidgets.ScorePopup.MPScr" )
require( "ui.uieditor.widgets.HUD.ZM_PrematchCountdown.ZM_PrematchCountdown" )
require( "ui.uieditor.widgets.HUD.ZM_TimeBar.ZM_BeastmodeTimeBarWidget" )
require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardWidgetCP" )
require( "ui.uieditor.widgets.ZMInventoryTomb.RocketShieldWidget_Tomb" )
require( "ui.uieditor.widgets.ZMInventoryTomb.ElementalStaffsWidget" )
require( "ui.uieditor.widgets.ZMInventoryTomb.MaxisDroneBlueprintWidget_Tomb" )
require( "ui.uieditor.widgets.ZMInventoryTomb.MusicalPartsWidget_Tomb" )
require( "ui.uieditor.widgets.Chat.inGame.IngameChatClientContainer" )
require( "ui.uieditor.widgets.ZMInventoryTomb.InventoryWidgetTomb" )
require( "ui.uieditor.widgets.ZMInventoryTomb.CaptureGeneratorWheelWidget_Tomb" )
require( "ui.uieditor.widgets.HUD.Waypoint.ZMTombCaptureZoneWaypointContainer" )

CoD.Zombie.CommonHudRequire()
CoD.GetCachedObjective = function ( f1_arg0 )
	if f1_arg0 == nil then
		return nil
	elseif CoD.Zombie.ObjectivesTable[f1_arg0] ~= nil then
		return CoD.Zombie.ObjectivesTable[f1_arg0]
	end
	local f1_local0 = Engine.GetObjectiveInfo( f1_arg0 )
	if f1_local0 ~= nil then
		CoD.Zombie.ObjectivesTable[f1_arg0] = f1_local0
	end
	return f1_local0
end

local PreLoadFunc = function ( self, controller )
	CoD.Zombie.CommonPreLoadHud( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "TombEndGameBlackScreen" )
end

local f0_local1 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1.controller
	if f3_arg0.objective.id == "zm_dlc5_recapture_zombie" then
		local gameTypeContainer = CoD.GenericWaypointContainer.new( f3_arg0.menu, f3_local0 )
		gameTypeContainer:setLeftRight( true, true, 0, 0 )
		gameTypeContainer:setTopBottom( true, true, 0, 0 )
		f3_arg0:addElement( gameTypeContainer )
		f3_arg0.gameTypeContainer = gameTypeContainer
		
	else
		local gameTypeContainer = CoD.ZMTombCaptureZoneWaypointContainer.new( f3_arg0.menu, f3_local0 )
		gameTypeContainer:setLeftRight( true, true, 0, 0 )
		gameTypeContainer:setTopBottom( true, true, 0, 0 )
		f3_arg0:addElement( gameTypeContainer )
		f3_arg0.gameTypeContainer = gameTypeContainer
	end
	f3_arg0.gameTypeContainer.objective = f3_arg0.objective
	f3_arg0.gameTypeContainer:setupWaypointContainer( f3_arg1 )
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	CoD.Zombie.CommonPostLoadHud( f4_arg0, f4_arg1 )
	local f4_local0 = function ( f5_arg0, f5_arg1 )
		local f5_local0 = Engine.GetObjectiveName( f5_arg1.controller, f5_arg1.objId )
		local f5_local1 = CoD.GetCachedObjective( f5_local0 )
		if f5_local1 == nil then
			return 
		elseif Dvar.cg_luiDebug:get() == true then
			DebugPrint( "Waypoint ID " .. f5_arg1.objId .. ": " .. f5_local0 .. ": " .. #f5_arg0.WaypointContainerList .. " waypoints active" )
		end
		if not f5_arg0.savedStates then
			f5_arg0.savedStates = {}
			f5_arg0.savedEntNums = {}
			f5_arg0.savedObjectiveNames = {}
			f5_arg0.savedTeam = -1
			f5_arg0.savedRound = -1
		end
		local f5_local2 = Engine.GetObjectiveState( f4_arg1, f5_arg1.objId )
		local f5_local3 = f5_arg0.savedStates[f5_arg1.objId]
		if not f5_local3 then
			f5_local3 = CoD.OBJECTIVESTATE_EMPTY
		end
		local f5_local4 = Engine.GetModelForController( f5_arg1.controller )
		local f5_local5 = Engine.GetModel( f5_local4, "objective" .. f5_arg1.objId )
		local f5_local6 = f5_local5 and Engine.GetModel( f5_local5, "state" )
		local f5_local7 = CoD.SafeGetModelValue( f5_local5, "entNum" )
		local f5_local8 = CoD.GetTeamID( f4_arg1 )
		local f5_local9 = Engine.GetRoundsPlayed( f4_arg1 )
		if f5_local8 ~= f5_arg0.savedTeam or f5_local9 ~= f5_arg0.savedRound then
			f5_arg0.savedStates = {}
			f5_arg0.savedEntNums = {}
			f5_arg0.savedObjectiveNames = {}
		end
		if not CoD.isCampaign and Engine.IsVisibilityBitSet( f4_arg1, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and f5_local2 == f5_local3 and f5_local7 == f5_arg0.savedEntNums[f5_arg1.objId] and f5_local0 == f5_arg0.savedObjectiveNames[f5_arg1.objId] then
			if f5_local6 ~= nil then
				Engine.ForceNotifyModelSubscriptions( f5_local6 )
			end
			return 
		elseif f5_local6 ~= nil then
			local f5_local10 = Engine.GetModelValue( f5_local6 )
			Engine.SetModelValue( f5_local6, CoD.OBJECTIVESTATE_EMPTY )
			Engine.SetModelValue( f5_local6, f5_local10 )
		end
		f5_arg0.savedStates[f5_arg1.objId] = f5_local2
		f5_arg0.savedEntNums[f5_arg1.objId] = f5_local7
		f5_arg0.savedObjectiveNames[f5_arg1.objId] = f5_local0
		f5_arg0.savedTeam = f5_local8
		f5_arg0.savedRound = f5_local9
		if f5_local0 then
			local f5_local10 = CoD.WaypointWidgetContainer.new( f5_arg0, f5_arg1.controller )
			f5_local10.objective = f5_local1
			f5_local10.setupWaypoint = f0_local1
			f5_local10:setupWaypoint( f5_arg1 )
			f5_local10:setLeftRight( true, true, 0, 0 )
			f5_local10:setTopBottom( true, true, 0, 0 )
			f5_arg0:addElement( f5_local10 )
			table.insert( f5_arg0.WaypointContainerList, f5_local10 )
			f5_local10:update( f5_arg1 )
			f5_local10:setModel( f5_local5 )
			local f5_local11 = f5_arg1.controller
			local f5_local12 = f5_arg0
			f5_local10:subscribeToModel( f5_local6, function ( model )
				local modelValue = Engine.GetModelValue( model )
				f5_arg0.savedStates[f5_arg1.objId] = modelValue
				if modelValue == CoD.OBJECTIVESTATE_ACTIVE or modelValue == CoD.OBJECTIVESTATE_CURRENT or modelValue == CoD.OBJECTIVESTATE_DONE then
					f5_local10:show()
					f5_local10:update( {
						controller = f5_local11,
						objState = modelValue
					} )
				elseif modelValue == CoD.OBJECTIVESTATE_EMPTY then
					f5_local12:removeWaypoint( f5_arg1.objId )
					f5_arg0.savedEntNums[f5_arg1.objId] = nil
				else
					f5_local10:hide()
				end
			end )
			local f5_local13 = Engine.GetModel( f5_local5, "updateTime" )
			if f5_local13 ~= nil then
				f5_local10:subscribeToModel( f5_local13, function ( model )
					f5_local10:update( {
						controller = f5_local11
					} )
				end )
			end
			f5_local10:subscribeToModel( Engine.GetModel( f5_local5, "progress" ), function ( model )
				f5_local10:update( {
					controller = f5_local11,
					progress = Engine.GetModelValue( model )
				} )
			end )
			f5_local10:subscribeToModel( Engine.GetModel( f5_local5, "clientUseMask" ), function ( model )
				f5_local10:update( {
					controller = f5_local11,
					clientUseMask = Engine.GetModelValue( model )
				} )
			end )
			local f5_local14 = Engine.GetModel( f5_local4, "profile.colorBlindMode" )
			if f5_local14 then
				f5_local10:subscribeToModel( f5_local14, function ( model )
					f5_local10:update( {
						controller = f5_local11
					} )
				end, false )
			end
		end
		return true
	end
	
	f4_arg0.WaypointBase.WaypointContainerList = {}
	CoD.Zombie.ObjectivesTable = Engine.BuildObjectivesTable()
	if CoD.Zombie.ObjectivesTable == nil or #CoD.Zombie.ObjectivesTable == 0 then
		error( "LUI Error: Failed to load objectives.json!" )
	end
	for f4_local1 = #CoD.Zombie.ObjectivesTable, 1, -1 do
		local f4_local4 = CoD.Zombie.ObjectivesTable[f4_local1]
		CoD.Zombie.ObjectivesTable[f4_local4.id] = f4_local4
		table.remove( CoD.Zombie.ObjectivesTable, f4_local1 )
	end
	f4_arg0:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f4_arg1 ), "newObjectiveType" .. Enum.ObjectiveTypes.OBJECTIVE_TYPE_WAYPOINT ), function ( model )
		f4_local0( f4_arg0.WaypointBase, {
			controller = f4_arg1,
			objId = Engine.GetModelValue( model ),
			objType = Enum.ObjectiveTypes.OBJECTIVE_TYPE_WAYPOINT
		} )
	end, false )
end

LUI.createMenu.T7Hud_zm_tomb = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_zm_tomb" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "T7Hud_zm_tomb.buttonPrompts" )
	local f12_local1 = self
	self.anyChildUsesUpdateState = true
	
	local stoneTabletClean = CoD.onOffImage.new( f12_local1, controller )
	stoneTabletClean:setLeftRight( false, false, -508, -444 )
	stoneTabletClean:setTopBottom( false, true, -142, -78 )
	stoneTabletClean.image:setImage( RegisterImage( "uie_zm_hud_icon_oneinch_clean" ) )
	stoneTabletClean:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				local f13_local0
				if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) then
					f13_local0 = IsModelValueEqualTo( controller, "zmInventory.player_tablet_state", 1 )
				else
					f13_local0 = false
				end
				return f13_local0
			end
		}
	} )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	stoneTabletClean:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_tablet_state" ), function ( model )
		f12_local1:updateElementState( stoneTabletClean, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_tablet_state"
		} )
	end )
	self:addElement( stoneTabletClean )
	self.stoneTabletClean = stoneTabletClean
	
	local stoneTabletDirty = CoD.onOffImage.new( f12_local1, controller )
	stoneTabletDirty:setLeftRight( false, false, -508, -444 )
	stoneTabletDirty:setTopBottom( false, true, -142, -78 )
	stoneTabletDirty.image:setImage( RegisterImage( "uie_zm_hud_icon_oneinch_dirty" ) )
	stoneTabletDirty:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				local f30_local0
				if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) then
					f30_local0 = IsModelValueEqualTo( controller, "zmInventory.player_tablet_state", 2 )
				else
					f30_local0 = false
				end
				return f30_local0
			end
		}
	} )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	stoneTabletDirty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_tablet_state" ), function ( model )
		f12_local1:updateElementState( stoneTabletDirty, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_tablet_state"
		} )
	end )
	self:addElement( stoneTabletDirty )
	self.stoneTabletDirty = stoneTabletDirty
	
	local ZMPerksContainerFactory = CoD.ZMPerksContainerFactory.new( f12_local1, controller )
	ZMPerksContainerFactory:setLeftRight( true, false, 130, 281 )
	ZMPerksContainerFactory:setTopBottom( false, true, -62, -26 )
	self:addElement( ZMPerksContainerFactory )
	self.ZMPerksContainerFactory = ZMPerksContainerFactory
	
	local Rounds = CoD.ZmRndContainer.new( f12_local1, controller )
	Rounds:setLeftRight( true, false, -32, 192 )
	Rounds:setTopBottom( false, true, -174, 18 )
	Rounds:setScale( 0.8 )
	self:addElement( Rounds )
	self.Rounds = Rounds
	
	local Ammo = CoD.ZmAmmoContainerFactory.new( f12_local1, controller )
	Ammo:setLeftRight( false, true, -427, 3 )
	Ammo:setTopBottom( false, true, -232, 0 )
	self:addElement( Ammo )
	self.Ammo = Ammo
	
	local Score = CoD.ZMScr.new( f12_local1, controller )
	Score:setLeftRight( true, false, 30, 164 )
	Score:setTopBottom( false, true, -256, -128 )
	Score:setYRot( 30 )
	Score:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				local f47_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f47_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
						f47_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
					else
						f47_local0 = false
					end
				end
				return f47_local0
			end
		}
	} )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		f12_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( Score )
	self.Score = Score
	
	local fullscreenContainer = CoD.DynamicContainerWidget.new( f12_local1, controller )
	fullscreenContainer:setLeftRight( false, false, -640, 640 )
	fullscreenContainer:setTopBottom( false, false, -360, 360 )
	self:addElement( fullscreenContainer )
	self.fullscreenContainer = fullscreenContainer
	
	local Notifications = CoD.Notification.new( f12_local1, controller )
	Notifications:setLeftRight( true, true, 0, 0 )
	Notifications:setTopBottom( true, true, 0, 0 )
	self:addElement( Notifications )
	self.Notifications = Notifications
	
	local ZmNotifBGBContainerFactory = CoD.ZmNotifBGB_ContainerFactory.new( f12_local1, controller )
	ZmNotifBGBContainerFactory:setLeftRight( false, false, -156, 156 )
	ZmNotifBGBContainerFactory:setTopBottom( true, false, -6, 247 )
	ZmNotifBGBContainerFactory:setScale( 0.75 )
	ZmNotifBGBContainerFactory:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f64_local0 = ZmNotifBGBContainerFactory
		if IsParamModelEqualToString( model, "zombie_bgb_token_notification" ) then
			AddZombieBGBTokenNotification( self, f64_local0, controller, model )
		elseif IsParamModelEqualToString( model, "zombie_bgb_notification" ) then
			AddZombieBGBNotification( self, f64_local0, model )
		elseif IsParamModelEqualToString( model, "zombie_notification" ) then
			AddZombieNotification( self, f64_local0, model )
		end
	end )
	self:addElement( ZmNotifBGBContainerFactory )
	self.ZmNotifBGBContainerFactory = ZmNotifBGBContainerFactory
	
	local GenericWaypointContainer = CoD.GenericWaypointContainer.new( f12_local1, controller )
	GenericWaypointContainer:setLeftRight( false, false, -640, 640 )
	GenericWaypointContainer:setTopBottom( false, false, -360, 360 )
	GenericWaypointContainer:setAlpha( 0 )
	self:addElement( GenericWaypointContainer )
	self.GenericWaypointContainer = GenericWaypointContainer
	
	local WaypointBase = CoD.WaypointBase.new( f12_local1, controller )
	WaypointBase:setLeftRight( false, false, -640, 640 )
	WaypointBase:setTopBottom( false, false, -360, 360 )
	WaypointBase:registerEventHandler( "menu_loaded", function ( element, event )
		local f65_local0 = nil
		SizeToSafeArea( element, controller )
		if not f65_local0 then
			f65_local0 = element:dispatchEventToChildren( event )
		end
		return f65_local0
	end )
	self:addElement( WaypointBase )
	self.WaypointBase = WaypointBase
	
	local CursorHint = CoD.ZMCursorHint.new( f12_local1, controller )
	CursorHint:setLeftRight( false, false, -250, 250 )
	CursorHint:setTopBottom( true, false, 522, 616 )
	CursorHint:mergeStateConditions( {
		{
			stateName = "Active_1x1",
			condition = function ( menu, element, event )
				local f66_local0 = IsCursorHintActive( controller )
				if f66_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 1 then
						f66_local0 = false
					else
						f66_local0 = true
					end
				end
				return f66_local0
			end
		},
		{
			stateName = "Active_2x1",
			condition = function ( menu, element, event )
				local f67_local0 = IsCursorHintActive( controller )
				if f67_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 2 then
						f67_local0 = false
					else
						f67_local0 = true
					end
				end
				return f67_local0
			end
		},
		{
			stateName = "Active_4x1",
			condition = function ( menu, element, event )
				local f68_local0 = IsCursorHintActive( controller )
				if f68_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 4 then
						f68_local0 = false
					else
						f68_local0 = true
					end
				end
				return f68_local0
			end
		},
		{
			stateName = "Active_NoImage",
			condition = function ( menu, element, event )
				local f69_local0 = IsCursorHintActive( controller )
				if f69_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
						f69_local0 = IsModelValueEqualTo( controller, "hudItems.cursorHintIconRatio", 0 )
					else
						f69_local0 = false
					end
				end
				return f69_local0
			end
		}
	} )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showCursorHint" ), function ( model )
		f12_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showCursorHint"
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		f12_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		f12_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		f12_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ), function ( model )
		f12_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		f12_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		f12_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		f12_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		f12_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cursorHintIconRatio" ), function ( model )
		f12_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cursorHintIconRatio"
		} )
	end )
	self:addElement( CursorHint )
	self.CursorHint = CursorHint
	
	local ConsoleCenter = CoD.CenterConsole.new( f12_local1, controller )
	ConsoleCenter:setLeftRight( false, false, -370, 370 )
	ConsoleCenter:setTopBottom( true, false, 68.5, 166.5 )
	self:addElement( ConsoleCenter )
	self.ConsoleCenter = ConsoleCenter
	
	local DeadSpectate = CoD.DeadSpectate.new( f12_local1, controller )
	DeadSpectate:setLeftRight( false, false, -150, 150 )
	DeadSpectate:setTopBottom( false, true, -180, -120 )
	self:addElement( DeadSpectate )
	self.DeadSpectate = DeadSpectate
	
	local MPScore = CoD.MPScr.new( f12_local1, controller )
	MPScore:setLeftRight( false, false, -50, 50 )
	MPScore:setTopBottom( true, false, 233.5, 258.5 )
	MPScore:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f80_local0 = MPScore
		if IsParamModelEqualToString( model, "score_event" ) and PropertyIsTrue( self, "menuLoaded" ) then
			PlayClipOnElement( self, {
				elementName = "MPScore",
				clipName = "NormalScore"
			}, controller )
			SetMPScoreText( f12_local1, f80_local0, controller, model )
		end
	end )
	self:addElement( MPScore )
	self.MPScore = MPScore
	
	local ZMPrematchCountdown0 = CoD.ZM_PrematchCountdown.new( f12_local1, controller )
	ZMPrematchCountdown0:setLeftRight( false, false, -640, 640 )
	ZMPrematchCountdown0:setTopBottom( false, false, -360, 360 )
	self:addElement( ZMPrematchCountdown0 )
	self.ZMPrematchCountdown0 = ZMPrematchCountdown0
	
	local ZMBeastBar = CoD.ZM_BeastmodeTimeBarWidget.new( f12_local1, controller )
	ZMBeastBar:setLeftRight( false, false, -242.5, 321.5 )
	ZMBeastBar:setTopBottom( false, true, -174, -18 )
	ZMBeastBar:setScale( 0.7 )
	self:addElement( ZMBeastBar )
	self.ZMBeastBar = ZMBeastBar
	
	local EndGameBlackScreen = LUI.UIImage.new()
	EndGameBlackScreen:setLeftRight( true, true, 0, 0 )
	EndGameBlackScreen:setTopBottom( true, true, 0, 0 )
	EndGameBlackScreen:setRGB( 0, 0, 0 )
	EndGameBlackScreen:setAlpha( 0 )
	self:addElement( EndGameBlackScreen )
	self.EndGameBlackScreen = EndGameBlackScreen
	
	local ScoreboardWidget = CoD.ScoreboardWidgetCP.new( f12_local1, controller )
	ScoreboardWidget:setLeftRight( false, false, -503, 503 )
	ScoreboardWidget:setTopBottom( true, false, 247, 773 )
	self:addElement( ScoreboardWidget )
	self.ScoreboardWidget = ScoreboardWidget
	
	local RocketShieldWidgetTomb = CoD.RocketShieldWidget_Tomb.new( f12_local1, controller )
	RocketShieldWidgetTomb:setLeftRight( true, false, -29, 285 )
	RocketShieldWidgetTomb:setTopBottom( true, false, 101.5, 230.5 )
	RocketShieldWidgetTomb:setScale( 0.8 )
	RocketShieldWidgetTomb:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and AlwaysFalse()
			end
		}
	} )
	RocketShieldWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f12_local1:updateElementState( RocketShieldWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RocketShieldWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		f12_local1:updateElementState( RocketShieldWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
		} )
	end )
	self:addElement( RocketShieldWidgetTomb )
	self.RocketShieldWidgetTomb = RocketShieldWidgetTomb
	
	local ElementalStaffsWidget = CoD.ElementalStaffsWidget.new( f12_local1, controller )
	ElementalStaffsWidget:setLeftRight( true, false, -36, 364 )
	ElementalStaffsWidget:setTopBottom( false, false, -171, -39 )
	ElementalStaffsWidget:setScale( 0.8 )
	ElementalStaffsWidget.WaterStaffContainer.ElementalStaffItem.staffPartFg:setRGB( 1, 1, 1 )
	ElementalStaffsWidget.LightningStaffContainer.ElementalStaffItem.staffPartFg:setRGB( 1, 1, 1 )
	ElementalStaffsWidget.AirStaffContainer.ElementalStaffItem.staffPartFg:setRGB( 1, 1, 1 )
	ElementalStaffsWidget.FireStaffContainer.ElementalStaffItem.staffPartFg:setRGB( 1, 1, 1 )
	ElementalStaffsWidget:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and AlwaysFalse()
			end
		}
	} )
	ElementalStaffsWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.air_staff.visible" ), function ( model )
		f12_local1:updateElementState( ElementalStaffsWidget, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.air_staff.visible"
		} )
	end )
	ElementalStaffsWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.fire_staff.visible" ), function ( model )
		f12_local1:updateElementState( ElementalStaffsWidget, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.fire_staff.visible"
		} )
	end )
	ElementalStaffsWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.lightning_staff.visible" ), function ( model )
		f12_local1:updateElementState( ElementalStaffsWidget, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.lightning_staff.visible"
		} )
	end )
	ElementalStaffsWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.water_staff.visible" ), function ( model )
		f12_local1:updateElementState( ElementalStaffsWidget, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.water_staff.visible"
		} )
	end )
	ElementalStaffsWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f12_local1:updateElementState( ElementalStaffsWidget, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( ElementalStaffsWidget )
	self.ElementalStaffsWidget = ElementalStaffsWidget
	
	local MaxisDroneBlueprintWidgetTomb = CoD.MaxisDroneBlueprintWidget_Tomb.new( f12_local1, controller )
	MaxisDroneBlueprintWidgetTomb:setLeftRight( true, false, -28, 286 )
	MaxisDroneBlueprintWidgetTomb:setTopBottom( true, false, 277, 406 )
	MaxisDroneBlueprintWidgetTomb:setScale( 0.8 )
	MaxisDroneBlueprintWidgetTomb:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and AlwaysFalse()
			end
		}
	} )
	MaxisDroneBlueprintWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f12_local1:updateElementState( MaxisDroneBlueprintWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	MaxisDroneBlueprintWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.show_maxis_drone_parts_widget" ), function ( model )
		f12_local1:updateElementState( MaxisDroneBlueprintWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.show_maxis_drone_parts_widget"
		} )
	end )
	self:addElement( MaxisDroneBlueprintWidgetTomb )
	self.MaxisDroneBlueprintWidgetTomb = MaxisDroneBlueprintWidgetTomb
	
	local MusicalPartsWidgetTomb = CoD.MusicalPartsWidget_Tomb.new( f12_local1, controller )
	MusicalPartsWidgetTomb:setLeftRight( true, false, -29, 285 )
	MusicalPartsWidgetTomb:setTopBottom( true, false, 17, 146 )
	MusicalPartsWidgetTomb:setScale( 0.8 )
	MusicalPartsWidgetTomb:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				local f93_local0
				if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) then
					f93_local0 = IsInventoryWidgetVisible( controller, "show_musical_parts_widget" )
				else
					f93_local0 = false
				end
				return f93_local0
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.show_musical_parts_widget" ), function ( model )
		f12_local1:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.show_musical_parts_widget"
		} )
	end )
	self:addElement( MusicalPartsWidgetTomb )
	self.MusicalPartsWidgetTomb = MusicalPartsWidgetTomb
	
	local IngameChatClientContainer = CoD.IngameChatClientContainer.new( f12_local1, controller )
	IngameChatClientContainer:setLeftRight( true, false, 0, 360 )
	IngameChatClientContainer:setTopBottom( true, false, -2.5, 717.5 )
	self:addElement( IngameChatClientContainer )
	self.IngameChatClientContainer = IngameChatClientContainer
	
	local IngameChatClientContainer0 = CoD.IngameChatClientContainer.new( f12_local1, controller )
	IngameChatClientContainer0:setLeftRight( true, false, 0, 360 )
	IngameChatClientContainer0:setTopBottom( true, false, -2.5, 717.5 )
	self:addElement( IngameChatClientContainer0 )
	self.IngameChatClientContainer0 = IngameChatClientContainer0
	
	local InventoryWidget = CoD.InventoryWidgetTomb.new( f12_local1, controller )
	InventoryWidget:setLeftRight( false, false, -640, 640 )
	InventoryWidget:setTopBottom( false, false, -360, 360 )
	self:addElement( InventoryWidget )
	self.InventoryWidget = InventoryWidget
	
	local CaptureGeneratorWheelWidgetTomb = CoD.CaptureGeneratorWheelWidget_Tomb.new( f12_local1, controller )
	CaptureGeneratorWheelWidgetTomb:setLeftRight( false, true, -256, 0 )
	CaptureGeneratorWheelWidgetTomb:setTopBottom( true, false, -27, 229 )
	CaptureGeneratorWheelWidgetTomb:setScale( 0.55 )
	CaptureGeneratorWheelWidgetTomb:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "capture_generator_wheel_widget" ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE )
			end
		}
	} )
	CaptureGeneratorWheelWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.capture_generator_wheel_widget" ), function ( model )
		f12_local1:updateElementState( CaptureGeneratorWheelWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.capture_generator_wheel_widget"
		} )
	end )
	CaptureGeneratorWheelWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		f12_local1:updateElementState( CaptureGeneratorWheelWidgetTomb, {
			name = "model_validation",
			menu = f12_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self:addElement( CaptureGeneratorWheelWidgetTomb )
	self.CaptureGeneratorWheelWidgetTomb = CaptureGeneratorWheelWidgetTomb
	
	local ZMTombCaptureZoneWaypointContainer = CoD.ZMTombCaptureZoneWaypointContainer.new( f12_local1, controller )
	ZMTombCaptureZoneWaypointContainer:setLeftRight( false, false, -640, 640 )
	ZMTombCaptureZoneWaypointContainer:setTopBottom( false, false, -360, 360 )
	ZMTombCaptureZoneWaypointContainer:setAlpha( 0 )
	self:addElement( ZMTombCaptureZoneWaypointContainer )
	self.ZMTombCaptureZoneWaypointContainer = ZMTombCaptureZoneWaypointContainer
	
	Score.navigation = {
		up = ScoreboardWidget,
		right = ScoreboardWidget
	}
	ScoreboardWidget.navigation = {
		left = Score,
		down = Score
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				EndGameBlackScreen:completeAnimation()
				self.EndGameBlackScreen:setAlpha( 0 )
				self.clipFinished( EndGameBlackScreen, {} )
			end,
			ShowEndGameBlackScreen = function ()
				self:setupElementClipCounter( 1 )
				EndGameBlackScreen:completeAnimation()
				self.EndGameBlackScreen:setAlpha( 1 )
				self.clipFinished( EndGameBlackScreen, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( f12_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f116_local0 = nil
		SizeToSafeArea( element, controller )
		SetProperty( self, "menuLoaded", true )
		if not f116_local0 then
			f116_local0 = element:dispatchEventToChildren( event )
		end
		return f116_local0
	end )
	self:subscribeToGlobalModel( controller, "PerController", "TombEndGameBlackScreen", function ( model )
		local f117_local0 = self
		if IsModelValueEqualTo( controller, "TombEndGameBlackScreen", 1 ) then
			PlayClip( self, "ShowEndGameBlackScreen", controller )
		elseif IsModelValueEqualTo( controller, "TombEndGameBlackScreen", 0 ) then
			PlayClip( self, "DefaultClip", controller )
		end
	end )
	Score.id = "Score"
	ScoreboardWidget.id = "ScoreboardWidget"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f12_local1
	} )
	if not self:restoreState() then
		self.ScoreboardWidget:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.stoneTabletClean:close()
		element.stoneTabletDirty:close()
		element.ZMPerksContainerFactory:close()
		element.Rounds:close()
		element.Ammo:close()
		element.Score:close()
		element.fullscreenContainer:close()
		element.Notifications:close()
		element.ZmNotifBGBContainerFactory:close()
		element.GenericWaypointContainer:close()
		element.WaypointBase:close()
		element.CursorHint:close()
		element.ConsoleCenter:close()
		element.DeadSpectate:close()
		element.MPScore:close()
		element.ZMPrematchCountdown0:close()
		element.ZMBeastBar:close()
		element.ScoreboardWidget:close()
		element.RocketShieldWidgetTomb:close()
		element.ElementalStaffsWidget:close()
		element.MaxisDroneBlueprintWidgetTomb:close()
		element.MusicalPartsWidgetTomb:close()
		element.IngameChatClientContainer:close()
		element.IngameChatClientContainer0:close()
		element.InventoryWidget:close()
		element.CaptureGeneratorWheelWidgetTomb:close()
		element.ZMTombCaptureZoneWaypointContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "T7Hud_zm_tomb.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

