require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidget_PanelVignetteRight" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetContainer" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetContainer" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetEMP" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetEMP" )
require( "ui.uieditor.widgets.CPSystems.CommsSystem.CommsSystemWidget" )
require( "ui.uieditor.widgets.DynamicContainerWidget" )
require( "ui.uieditor.widgets.HUD.CP_PartyList.PartyListContainerParent" )
require( "ui.uieditor.widgets.CPLevels.RamsesStation.WoundedSoldiers.woundedSoldierWidget" )
require( "ui.uieditor.widgets.CPSystems.EnemyTarget.EnemyTargetInternal" )
require( "ui.uieditor.widgets.CPSystems.IncomingExplosive.IncomingExplosiveInternal" )
require( "ui.uieditor.widgets.CPSystems.TacticalMode.ClampedShooterWidget" )
require( "ui.uieditor.widgets.CPSystems.TacticalMode.TacticalModeWidget" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeCounter.SpikeLauncherSpikeCounter" )
require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpointIndicator" )

local PostLoadFunc = function ( self, controller )
	local worldIndicatorModel = Engine.GetModel( Engine.GetModelForController( controller ), "WorldSpaceIndicators" )
	if CoD.isSafehouse then
		self.fullscreenContainer:addElement( LUI.createMenu.MissionRecordVaultScreens( controller ) )
	end
	local CreateWeakpoint = function ( entNumber, boneName )
		local worldIconModel = Engine.GetModel( Engine.GetModelForController( controller ), "WorldSpaceIndicators" )
		if worldIconModel then
			local weakpointModel = Engine.CreateModel( worldIconModel, "weakpoint_" .. entNumber .. "_" .. boneName )
			if weakpointModel then
				LUI.CreateModelAndInitialize( weakpointModel, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_DEFAULT )
				local newWeakpoint = CoD.weakpointIndicator.new( self, controller )
				newWeakpoint:setModel( weakpointModel )
				newWeakpoint:setupWeakpointIndicator( controller, entNumber, boneName )
				LUI.OverrideFunction_CallOriginalFirst( newWeakpoint, "close", function ()
					Engine.UnsubscribeAndFreeModel( weakpointModel )
				end )
				return newWeakpoint
			end
		end
	end
	
	self.weakpoints = {}
	self:registerEventHandler( "weakpoint_update", function ( self, event )
		local f4_local0 = event.data[1] == 0
		local entNumber = event.data[2]
		local boneName = Engine.GetIString( event.data[3], "CS_LOCALIZED_STRINGS" )
		if event.data[1] == 0 then
			if self.weakpoints[entNumber] and self.weakpoints[entNumber][boneName] then
				local statusModel = self.weakpoints[entNumber][boneName]:getModel( controller, "status" )
				if statusModel then
					Engine.SetModelValue( statusModel, Enum.WeakpointWidgetStates.WEAKPOINT_STATE_CLOSING )
				end
				local weakpointWidget = self.weakpoints[entNumber][boneName]
				weakpointWidget:addElement( LUI.UITimer.newElementTimer( 1500, true, weakpointWidget.close, weakpointWidget ) )
				self.weakpoints[entNumber][boneName] = nil
			end
		elseif event.data[1] == 1 then
			if not self.weakpoints[entNumber] then
				self.weakpoints[entNumber] = {}
			end
			if not self.weakpoints[entNumber][boneName] then
				local newWeakpoint = CreateWeakpoint( entNumber, boneName )
				if newWeakpoint then
					self.weakpoints[entNumber][boneName] = newWeakpoint
					self.fullscreenContainer:addElement( newWeakpoint )
					newWeakpoint:processEvent( {
						name = "update_state",
						controller = controller,
						menu = self
					} )
				end
			end
		elseif event.data[1] == 2 then
			if self.weakpoints[entNumber] and self.weakpoints[entNumber][boneName] then
				self.weakpoints[entNumber][boneName]:playClip( "Damaged" )
			end
		elseif event.data[1] == 3 and self.weakpoints[entNumber] and self.weakpoints[entNumber][boneName] then
			self.weakpoints[entNumber][boneName]:playClip( "Repulsed" )
		end
	end )
	if worldIndicatorModel then
		local enemyTargetModels = {
			{
				name = "targetState",
				defaultValue = Enum.EnemyTargetStates.ENEMY_TARGET_NONE
			}
		}
		local index = 0
		local createAnother = true
		while createAnother do
			local newWidgetModel = Engine.CreateModel( worldIndicatorModel, "enemyTargets." .. index )
			for _, models in ipairs( enemyTargetModels ) do
				LUI.CreateModelAndInitialize( newWidgetModel, models.name, models.defaultValue )
			end
			local newEnemyTargetingReticle = CoD.EnemyTargetInternal.new( self, controller )
			newEnemyTargetingReticle:setModel( newWidgetModel )
			createAnother = newEnemyTargetingReticle:setupCybercomLockon( index, controller )
			self.fullscreenContainer:addElement( newEnemyTargetingReticle )
			newEnemyTargetingReticle:processEvent( {
				name = "update_state",
				controller = controller
			} )
			index = index + 1
		end
	end
	if worldIndicatorModel then
		local enemyTargetModels = {
			{
				name = "distance",
				defaultValue = 0
			},
			{
				name = "explosivesImage",
				defaultValue = "uie_img_t7_hud_widget_ammo_1_icon_grenade"
			},
			{
				name = "timeLeftPerc",
				defaultValue = -1
			},
			{
				name = "visible",
				defaultValue = false
			}
		}
		local index = 0
		local createAnother = true
		while createAnother do
			local newWidgetModel = Engine.CreateModel( worldIndicatorModel, "explosivesWarnings." .. index )
			for _, models in ipairs( enemyTargetModels ) do
				LUI.CreateModelAndInitialize( newWidgetModel, models.name, models.defaultValue )
			end
			local newExplosiveWarningWidget = CoD.IncomingExplosiveInternal.new( self, controller )
			newExplosiveWarningWidget:setModel( newWidgetModel )
			newExplosiveWarningWidget:setPriority( 100 )
			createAnother = newExplosiveWarningWidget:setupIncomingExplosive( index, controller )
			self.fullscreenContainer:addElement( newExplosiveWarningWidget )
			newExplosiveWarningWidget:processEvent( {
				name = "update_state",
				controller = controller
			} )
			index = index + 1
		end
	end
	if worldIndicatorModel then
		local enemyTargetModels = {
			{
				name = "distance",
				defaultValue = 0
			},
			{
				name = "isShooting",
				defaultValue = false
			},
			{
				name = "isShootingPlayer",
				defaultValue = false
			},
			{
				name = "isManeuvering",
				defaultValue = false
			},
			{
				name = "isSuppressed",
				defaultValue = false
			},
			{
				name = "health",
				defaultValue = 0
			},
			{
				name = "archetypeImage",
				defaultValue = ""
			},
			{
				name = "alpha",
				defaultValue = 0
			}
		}
		local index = true
		local index = 0
		while index do
			local newWidgetModel = Engine.CreateModel( worldIndicatorModel, "tacticalMode" .. index )
			for _, models in ipairs( enemyTargetModels ) do
				LUI.CreateModelAndInitialize( newWidgetModel, models.name, models.defaultValue )
			end
			local newTacticalWidget = CoD.TacticalModeWidget.new( self, controller )
			newTacticalWidget:setModel( newWidgetModel )
			index = newTacticalWidget:setupTacticalWidget( index, controller )
			self.fullscreenContainer:addElement( newTacticalWidget )
			index = index + 1
		end
		local clampedShooterWidgetModels = {
			{
				name = "archetypeImage",
				defaultValue = ""
			},
			{
				name = "alpha",
				defaultValue = 0
			},
			{
				name = "arrowRotation",
				defaultValue = 0
			},
			{
				name = "shootingAtPlayer",
				defaultValue = false
			}
		}
		local createAnother = true
		index = 0
		while createAnother do
			local newWidgetModel = Engine.CreateModel( worldIndicatorModel, "clampedShooter" .. index )
			for _, models in ipairs( clampedShooterWidgetModels ) do
				LUI.CreateModelAndInitialize( newWidgetModel, models.name, models.defaultValue )
			end
			local shooterWidget = CoD.ClampedShooterWidget.new( self, controller )
			shooterWidget:setModel( newWidgetModel )
			createAnother = shooterWidget:setupClampedShooterWidget( index, controller )
			self.fullscreenContainer:addElement( shooterWidget )
			index = index + 1
		end
	end
	local enemyTargetModels = function ( element, event )
		local controller = event.controller or controller
		local objectiveName = Engine.GetObjectiveName( controller, event.objId )
		local objective = CoD.GetCachedObjective( objectiveName )
		if objective == nil then
			return 
		elseif Engine.GetObjectiveState( controller, event.objId ) == CoD.OBJECTIVESTATE_ACTIVE then
			local objectiveModel = Engine.GetModel( Engine.GetModelForController( controller ), "objective" .. event.objId )
			if objectiveModel then
				Engine.SetModelValue( Engine.CreateModel( objectiveModel, "woundType" ), event.woundType )
				Engine.SetModelValue( Engine.CreateModel( objectiveModel, "view_state" ), Enum.WaypointState.WAYPOINT_STATE_DEFAULT )
				local woundedSoldierWidget = CoD.woundedSoldierWidget.new( self, controller )
				woundedSoldierWidget:setModel( objectiveModel )
				woundedSoldierWidget:setupEntityObjectiveContainer( event.objId )
				self.fullscreenContainer:addElement( woundedSoldierWidget )
				woundedSoldierWidget:processEvent( {
					name = "update_state",
					controller = controller
				} )
			end
		end
	end
	
	self:registerEventHandler( "new_objective", function ( self, event )
		if event.objType == Enum.ObjectiveTypes.OBJECTIVE_TYPE_WOUNDED_SOLDIER then
			return enemyTargetModels( self.WoundedSoldierBase, event )
		else
			
		end
	end )
	if Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ) ~= nil then
		self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
			if IsCurrentViewmodelWeaponName( controller, "spike_launcher" ) then
				self.spikeLauncherCounter = CoD.SpikeLauncherSpikeCounter.new( self, controller )
				self:addElement( self.spikeLauncherCounter )
				self.spikeLauncherCounter:dispatchEventToChildren( {
					name = "update_state",
					controller = controller
				} )
			elseif self.spikeLauncherCounter ~= nil then
				self.spikeLauncherCounter:close()
				self.spikeLauncherCounter = nil
			end
		end )
	end
	local index = self.close
	self.close = function ( self )
		index( self )
		if self.spikeLauncherCounter ~= nil then
			self.spikeLauncherCounter:close()
		end
	end
	
end

LUI.createMenu.T7Hud_CP = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_CP" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local PanelVignetteRight = CoD.MapWidget_PanelVignetteRight.new( self, controller )
	PanelVignetteRight:setLeftRight( false, false, 88, 660 )
	PanelVignetteRight:setTopBottom( false, false, -362, 54 )
	PanelVignetteRight:setRGB( 1, 1, 1 )
	self:addElement( PanelVignetteRight )
	self.PanelVignetteRight = PanelVignetteRight
	
	local DamageWidgetContainer = CoD.DamageWidgetContainer.new( self, controller )
	DamageWidgetContainer:setLeftRight( true, false, 15, 281 )
	DamageWidgetContainer:setTopBottom( false, true, -132, -26 )
	DamageWidgetContainer:setRGB( 1, 1, 1 )
	self:addElement( DamageWidgetContainer )
	self.DamageWidgetContainer = DamageWidgetContainer
	
	local AmmoWidgetContainer = CoD.AmmoWidgetContainer.new( self, controller )
	AmmoWidgetContainer:setLeftRight( false, true, -421, -23 )
	AmmoWidgetContainer:setTopBottom( false, true, -156, -32 )
	AmmoWidgetContainer:setRGB( 1, 1, 1 )
	self:addElement( AmmoWidgetContainer )
	self.AmmoWidgetContainer = AmmoWidgetContainer
	
	local EMPWeaponInfo = CoD.AmmoWidgetEMP.new( self, controller )
	EMPWeaponInfo:setLeftRight( false, true, -341, 0 )
	EMPWeaponInfo:setTopBottom( false, true, -171, 0 )
	EMPWeaponInfo:setRGB( 1, 1, 1 )
	self:addElement( EMPWeaponInfo )
	self.EMPWeaponInfo = EMPWeaponInfo
	
	local EMPScoreInfo = CoD.DamageWidgetEMP.new( self, controller )
	EMPScoreInfo:setLeftRight( true, false, 0, 341 )
	EMPScoreInfo:setTopBottom( false, true, -171, 0 )
	EMPScoreInfo:setRGB( 1, 1, 1 )
	self:addElement( EMPScoreInfo )
	self.EMPScoreInfo = EMPScoreInfo
	
	local CommsSystemWidget = CoD.CommsSystemWidget.new( self, controller )
	CommsSystemWidget:setLeftRight( false, true, -441, -41 )
	CommsSystemWidget:setTopBottom( true, false, 29, 529 )
	CommsSystemWidget:setRGB( 1, 1, 1 )
	CommsSystemWidget:setXRot( -17 )
	CommsSystemWidget:setYRot( -21 )
	self:addElement( CommsSystemWidget )
	self.CommsSystemWidget = CommsSystemWidget
	
	local fullscreenContainer = CoD.DynamicContainerWidget.new( self, controller )
	fullscreenContainer:setLeftRight( false, false, -640, 640 )
	fullscreenContainer:setTopBottom( false, false, -360, 360 )
	fullscreenContainer:setRGB( 1, 1, 1 )
	self:addElement( fullscreenContainer )
	self.fullscreenContainer = fullscreenContainer
	
	local PartyListContainerParent0 = CoD.PartyListContainerParent.new( self, controller )
	PartyListContainerParent0:setLeftRight( false, true, -289, -23 )
	PartyListContainerParent0:setTopBottom( false, true, -244, -132 )
	PartyListContainerParent0:setRGB( 1, 1, 1 )
	PartyListContainerParent0:registerEventHandler( "hud_boot", function ( element, event )
		local retVal = nil
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( PartyListContainerParent0 )
	self.PartyListContainerParent0 = PartyListContainerParent0
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	self.close = function ( self )
		self.PanelVignetteRight:close()
		self.DamageWidgetContainer:close()
		self.AmmoWidgetContainer:close()
		self.EMPWeaponInfo:close()
		self.EMPScoreInfo:close()
		self.CommsSystemWidget:close()
		self.fullscreenContainer:close()
		self.PartyListContainerParent0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

