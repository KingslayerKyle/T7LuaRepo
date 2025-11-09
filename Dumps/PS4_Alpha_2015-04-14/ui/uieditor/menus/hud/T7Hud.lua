require( "ui.uieditor.widgets.MPHudWidgets.ArmorOverlayContainer" )
require( "ui.uieditor.widgets.HUD.fx.vignette_corner_right" )
require( "ui.uieditor.widgets.HUD.fx.vignette_corner" )
require( "ui.uieditor.widgets.MPHudWidgets.WaypointBase" )
require( "ui.uieditor.widgets.MPHudWidgets.Inventory.OtherHasItemWidget" )
require( "ui.uieditor.widgets.MPHudWidgets.Inventory.PlayerHasItemWidget" )
require( "ui.uieditor.widgets.DynamicContainerWidget" )
require( "ui.uieditor.widgets.Notifications.Notification" )
require( "ui.uieditor.widgets.MPHudWidgets.ResourceEnergyBar" )
require( "ui.uieditor.widgets.MPHudWidgets.WarlordArmorRegenerationBar" )
require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.ThrustMeter" )
require( "ui.uieditor.widgets.HUD.Outcome.Outcome" )
require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.Boot.ThrustMeterBootContainer" )
require( "ui.uieditor.widgets.HUD.Console.Console" )
require( "ui.uieditor.widgets.MPHudWidgets.Stuck" )
require( "ui.uieditor.widgets.MPHudWidgets.CursorHint" )
require( "ui.uieditor.widgets.MPHudWidgets.ShockCharge" )
require( "ui.uieditor.widgets.EndGameFlow.Top3PlayersScreenWidget" )
require( "ui.uieditor.widgets.HUD.ProximityAlarm.ProximityAlarm" )
require( "ui.uieditor.widgets.HUD.Equipment.BlackHat.BlackHat" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown" )
require( "ui.uieditor.widgets.MPHudWidgets.ButtonPrompt.ButtonPrompt3d" )

CoD.T7Hud = {}
local T7Hud_MaxButtonPrompts = 10
local UpdateInventoryClientField = function ( self, event )
	local missionData = {
		mi_sing_blackstation_fuel_cell = {
			small = "t7_hud_fuel_cell_small",
			large = "t7_hud_fuel_cell",
			text = " has the fuel cell"
		},
		mi_sing_blackstation_power_coupling = {
			small = "t7_hud_power_coupling_small",
			large = "t7_hud_power_coupling",
			text = " has the power coupling"
		}
	}
	local setOtherWidgetInfo = function ( self, otherWidgetIndex, newItem, newOwner, controller )
		local otherWidgetData = self.otherPlayerWidgets[otherWidgetIndex]
		if not newItem then
			otherWidgetData.widget:setState( "DefaultState" )
		else
			local calloutPlayerData = Engine.GetCalloutPlayerData( controller, newOwner - 1 )
			otherWidgetData.widget.icon:setImage( RegisterMaterial( missionData[newItem].small ) )
			otherWidgetData.widget.playerControlText:setText( calloutPlayerData.playerName .. missionData[newItem].text )
			otherWidgetData.widget:setState( "Visible" )
		end
		otherWidgetData.item = newItem
		otherWidgetData.owner = newOwner
	end
	
	local setOurWidgetInfo = function ( self, playerWidgetIndex, newItem, newOwner )
		local ourWidgetData = self.ourInventoryWidgets[playerWidgetIndex]
		if not newItem then
			ourWidgetData.widget:setState( "DefaultState" )
		else
			ourWidgetData.widget.icon:setImage( RegisterMaterial( missionData[newItem].large ) )
			ourWidgetData.widget:setState( "Visible" )
		end
		ourWidgetData.item = newItem
	end
	
	local removeItemFromWidgetList = function ( self, item, widgetList, setDataFunction, controller )
		for widgetIndex = #widgetList, 1, -1 do
			local widgetData = widgetList[widgetIndex]
			if widgetData.item == item then
				for curSetWidget = widgetIndex, #widgetList, 1 do
					local nextWidgetIndex = curSetWidget + 1
					if #widgetList < nextWidgetIndex then
						setDataFunction( self, curSetWidget, nil, nil, nil )
					else
						setDataFunction( self, curSetWidget, widgetList[nextWidgetIndex].item, widgetList[nextWidgetIndex].owner, controller )
					end
				end
			end
		end
	end
	
	local addItemToWidgetList = function ( self, item, owner, widgetList, setDataFunction, controller )
		for widgetIndex = 1, #widgetList, 1 do
			local widgetData = widgetList[widgetIndex]
			if not widgetData.item or widgetData.item == item then
				setDataFunction( self, widgetIndex, item, owner, controller )
				break
			end
		end
	end
	
	if event.newValue == 0 then
		removeItemFromWidgetList( self, event.name, self.otherPlayerWidgets, setOtherWidgetInfo, event.controller )
		removeItemFromWidgetList( self, event.name, self.ourInventoryWidgets, setOurWidgetInfo, event.controller )
	elseif event.newValue == Engine.GetClientNum( event.controller ) + 1 then
		removeItemFromWidgetList( self, event.name, self.otherPlayerWidgets, setOtherWidgetInfo, event.controller )
		addItemToWidgetList( self, event.name, nil, self.ourInventoryWidgets, setOurWidgetInfo, event.controller )
	else
		removeItemFromWidgetList( self, event.name, self.ourInventoryWidgets, setOurWidgetInfo, event.controller )
		addItemToWidgetList( self, event.name, event.newValue, self.otherPlayerWidgets, setOtherWidgetInfo, event.controller )
	end
end

local SetupCenterConsole = function ( self )
	self.ConsoleCenter:registerEventHandler( "console_center_update", function ( element, event )
		element:updateConsole( event )
	end )
	self.ConsoleCenter:registerEventHandler( "console_update", nil )
end

CoD.GetCachedObjective = function ( objectiveName )
	if objectiveName == nil then
		return nil
	elseif CoD.T7Hud.ObjectivesTable[objectiveName] ~= nil then
		return CoD.T7Hud.ObjectivesTable[objectiveName]
	end
	local objective = Engine.GetObjectiveInfo( objectiveName )
	if objective ~= nil then
		CoD.T7Hud.ObjectivesTable[objectiveName] = objective
	end
	return objective
end

local PostLoadFunc = function ( self, controller )
	local createPrematchTimer = function ( element, event )
		local controller = event.controller or controller
		local endTime = event.data[1]
		if endTime and not self.PrematchCountdown then
			local prematchCountdown = CoD.PrematchCountdown.new( self, controller )
			prematchCountdown:setupCountdown( endTime )
			prematchCountdown:setLeftRight( false, false, -640, 640 )
			prematchCountdown:setTopBottom( false, false, -360, 360 )
			prematchCountdown:addElementBefore( self.WaypointBase )
			self.PrematchCountdown = prematchCountdown
		end
	end
	
	self:registerEventHandler( "create_prematch_timer", createPrematchTimer )
	self.PrematchCountdown = nil
	local objectivesById = {}
	local handleCreateInteractivePrompt = function ( element, event )
		local controller = event.controller or controller
		local objectiveName = Engine.GetObjectiveName( controller, event.objId )
		local objective = CoD.GetCachedObjective( objectiveName )
		if objective == nil then
			return 
		elseif objective.notify_string ~= nil and objective.notify_string ~= "" then
			self.T7HudMenuGameMode.CommsSystemWidget:processEvent( {
				name = "comms_event_message",
				controller = event.controller,
				data = {
					objective.notify_string
				}
			} )
		end
		if Engine.GetObjectiveState( controller, event.objId ) == CoD.OBJECTIVESTATE_ACTIVE then
			local buttonPrompt3d = CoD.ButtonPrompt3d.new( self, controller )
			buttonPrompt3d.objective = objective
			buttonPrompt3d:setupEntity( event )
			local objectiveModel = Engine.GetModel( Engine.GetModelForController( controller ), "objective" .. event.objId )
			buttonPrompt3d:setModel( objectiveModel )
			self.interactPromptContainer:addElement( buttonPrompt3d )
			buttonPrompt3d:subscribeToModel( Engine.GetModel( objectiveModel, "state" ), function ( model )
				local state = Engine.GetModelValue( model )
				if state ~= CoD.OBJECTIVESTATE_ACTIVE and state ~= CoD.OBJECTIVESTATE_INVISIBLE then
					buttonPrompt3d:close()
				end
			end )
		end
		element:dispatchEventToChildren( event )
		return true
	end
	
	local objResourceEnergyBarFunc = function ( element, event )
		local controller = event.controller or controller
		AddResourceEnergyBar( self, element, controller, event )
		element:dispatchEventToChildren( event )
	end
	
	local handleCreateWaypoint = function ( element, event )
		local objectiveName = Engine.GetObjectiveName( event.controller, event.objId )
		local objective = CoD.GetCachedObjective( objectiveName )
		if objective == nil then
			return 
		elseif objective.notify_string ~= nil and objective.notify_string ~= "" then
			self.T7HudMenuGameMode.CommsSystemWidget:processEvent( {
				name = "comms_event_message",
				controller = event.controller,
				data = {
					objective.notify_string
				}
			} )
		end
		element:removeWaypoint( event.objId )
		if objectiveName then
			local waypointContainer = CoD.WaypointWidgetContainer.new( self, event.controller )
			waypointContainer.objective = objective
			waypointContainer:setupWaypoint( event )
			element:addElement( waypointContainer )
			table.insert( element.WaypointContainerList, waypointContainer )
			waypointContainer:update( event )
			waypointContainer:setModel( Engine.GetModel( Engine.GetModelForController( controller ), "objective" .. event.objId ) )
			local controller = event.controller
			if Engine.GetModel( Engine.GetModelForController( controller ), "objective" .. event.objId .. ".entNum" ) ~= nil and objectiveName == "sd_bomb" then
				element.SDOverlay.BombHeld:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "objective" .. event.objId .. ".entNum" ), function ( model )
					element.SDOverlay.BombHeld:updateState( {
						name = "model_validation",
						controller = controller,
						modelValue = Engine.GetModelValue( model ),
						modelName = "objective" .. event.objId .. ".entNum"
					} )
				end )
			end
			local waypointBase = element
			waypointContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "objective" .. event.objId .. ".state" ), function ( model )
				local stateValue = Engine.GetModelValue( model )
				if stateValue == CoD.OBJECTIVESTATE_ACTIVE or stateValue == CoD.OBJECTIVESTATE_CURRENT or stateValue == CoD.OBJECTIVESTATE_DONE then
					waypointContainer:show()
					waypointContainer:update( {
						controller = controller,
						objState = stateValue
					} )
				elseif stateValue == CoD.OBJECTIVESTATE_EMPTY then
					waypointBase:removeWaypoint( event.objId )
				else
					waypointContainer:hide()
				end
			end )
			local updateTimeModel = Engine.GetModel( Engine.GetModelForController( controller ), "objective" .. event.objId .. ".updateTime" )
			if updateTimeModel ~= nil then
				waypointContainer:subscribeToModel( updateTimeModel, function ( model )
					waypointContainer:update( {
						controller = controller
					} )
				end )
			end
			waypointContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "objective" .. event.objId .. ".progress" ), function ( model )
				waypointContainer:update( {
					controller = controller,
					progress = Engine.GetModelValue( model )
				} )
			end )
			waypointContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "objective" .. event.objId .. ".clientUseMask" ), function ( model )
				waypointContainer:update( {
					controller = controller,
					clientUseMask = Engine.GetModelValue( model )
				} )
			end )
		end
		return true
	end
	
	self.WaypointBase.WaypointContainerList = {}
	CoD.T7Hud.ObjectivesTable = Engine.BuildObjectivesTable()
	if nil == CoD.T7Hud.ObjectivesTable or #CoD.T7Hud.ObjectivesTable == 0 then
		error( "LUI Error: Failed to load objectives.json!" )
	end
	for i = #CoD.T7Hud.ObjectivesTable, 1, -1 do
		local objective = CoD.T7Hud.ObjectivesTable[i]
		CoD.T7Hud.ObjectivesTable[objective.id] = objective
		table.remove( CoD.T7Hud.ObjectivesTable, i )
	end
	self:registerEventHandler( "new_objective", function ( self, event )
		if event.objType == Enum.ObjectiveTypes.OBJECTIVE_TYPE_WAYPOINT then
			return handleCreateWaypoint( self.WaypointBase, event )
		elseif event.objType == Enum.ObjectiveTypes.OBJECTIVE_TYPE_3DPROMPT then
			return handleCreateInteractivePrompt( self.interactPromptContainer, event )
		else
			return self:dispatchEventToChildren( event )
		end
	end )
	self.ResourceEnergyBar:registerEventHandler( "resource_energy_bar", objResourceEnergyBarFunc )
	local objWarlordArmorRegenerationBarFunc = function ( element, event )
		local controller = event.controller or controller
		AddWarlordArmorRegenerationBar( self, element, controller, event )
		element:dispatchEventToChildren( event )
	end
	
	self.WarlordArmorRegenerationBar:registerEventHandler( "warlord_armor_regeneration_bar", objWarlordArmorRegenerationBarFunc )
	local interactiveButtonPromptFunc = function ( element, event )
		local controller = event.controller or controller
		AddInteractiveButtonPrompt( self, element, controller, event )
		element:dispatchEventToChildren( event )
	end
	
	self.interactPromptContainer:registerEventHandler( "interactive_prompt", interactiveButtonPromptFunc )
	self.proximityAlarm:registerEventHandler( "hud_update_refresh", function ( element, event )
		element:setState( "DefaultState" )
	end )
	self:registerEventHandler( "proximity_alarm", function ( element, event )
		if event.newValue == 1 then
			element.proximityAlarm:playClip( "Armed" )
		elseif event.newValue == 2 then
			element.proximityAlarm:setState( "Alarm" )
		else
			element.proximityAlarm:setState( "DefaultState" )
		end
		return true
	end )
	self:registerEventHandler( "hud_update_ctf_carriers", function ( element, event )
		local CTFModel = Engine.CreateModel( Engine.GetModelForController( event.controller ), "CTF" )
		Engine.SetModelValue( Engine.CreateModel( CTFModel, "friendlyFlagCarrier" ), event.friendlyCarrier or "" )
		Engine.SetModelValue( Engine.CreateModel( CTFModel, "friendlyFlagAway" ), event.friendlyFlagAway )
		Engine.SetModelValue( Engine.CreateModel( CTFModel, "enemyFlagCarrier" ), event.enemyCarrier or "" )
		Engine.SetModelValue( Engine.CreateModel( CTFModel, "enemyFlagAway" ), event.enemyFlagAway )
		return true
	end )
	self.otherPlayerWidgets = {
		{
			widget = self.OtherHasItemWidget0,
			item = nil,
			owner = nil
		},
		{
			widget = self.OtherHasItemWidget1,
			item = nil,
			owner = nil
		},
		{
			widget = self.OtherHasItemWidget2,
			item = nil,
			owner = nil
		}
	}
	self.ourInventoryWidgets = {
		{
			widget = self.PlayerHasItemWidget0,
			item = nil,
			owner = nil
		},
		{
			widget = self.PlayerHasItemWidget1,
			item = nil,
			owner = nil
		}
	}
	self:registerEventHandler( "mi_sing_blackstation_fuel_cell", UpdateInventoryClientField )
	self:registerEventHandler( "mi_sing_blackstation_power_coupling", UpdateInventoryClientField )
	require( "ui.T6.HUD.Compass" )
	require( "ui_mp.T6.HUD.IngameVoipDock" )
	SetupCenterConsole( self )
	self.m_inputDisabled = true
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		if IsCurrentViewmodelWeaponName( controller, "pda_hack" ) then
			self.BlackHat = CoD.BlackHat.new( self, controller )
			self:addElement( self.BlackHat )
			self.BlackHat:dispatchEventToChildren( {
				name = "update_state",
				controller = controller
			} )
		elseif self.BlackHat ~= nil then
			self.BlackHat:close()
			self.BlackHat = nil
		end
	end )
	local f9_local1 = self.close
	self.close = function ( self )
		f9_local1( self )
		if self.BlackHat ~= nil then
			self.BlackHat:close()
		end
	end
	
	self:registerEventHandler( "console_update", function ( self, event )
		self.Console:updateConsole( event )
		return true
	end )
	self:registerEventHandler( "game_options_update", function ( self, event )
		return true
	end )
end

LUI.createMenu.T7Hud = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local ArmorOverlayContainer0 = CoD.ArmorOverlayContainer.new( self, controller )
	ArmorOverlayContainer0:setLeftRight( true, true, 0, 0 )
	ArmorOverlayContainer0:setTopBottom( true, true, 0, 0 )
	ArmorOverlayContainer0:setRGB( 1, 1, 1 )
	ArmorOverlayContainer0:setAlpha( 0.75 )
	self:addElement( ArmorOverlayContainer0 )
	self.ArmorOverlayContainer0 = ArmorOverlayContainer0
	
	local vignettecornerright0 = CoD.vignette_corner_right.new( self, controller )
	vignettecornerright0:setLeftRight( false, false, 209, 665 )
	vignettecornerright0:setTopBottom( false, false, 88.92, 386 )
	vignettecornerright0:setRGB( 1, 1, 1 )
	vignettecornerright0:setAlpha( 0.25 )
	self:addElement( vignettecornerright0 )
	self.vignettecornerright0 = vignettecornerright0
	
	local vignettecornerL = CoD.vignette_corner.new( self, controller )
	vignettecornerL:setLeftRight( false, false, -671, -213 )
	vignettecornerL:setTopBottom( false, false, 88.92, 386 )
	vignettecornerL:setRGB( 1, 1, 1 )
	vignettecornerL:setAlpha( 0.25 )
	self:addElement( vignettecornerL )
	self.vignettecornerL = vignettecornerL
	
	local WaypointBase = CoD.WaypointBase.new( self, controller )
	WaypointBase:setLeftRight( false, false, -640, 640 )
	WaypointBase:setTopBottom( false, false, -360, 360 )
	WaypointBase:setRGB( 1, 1, 1 )
	self:addElement( WaypointBase )
	self.WaypointBase = WaypointBase
	
	local OtherHasItemWidget0 = CoD.OtherHasItemWidget.new( self, controller )
	OtherHasItemWidget0:setLeftRight( true, false, 15, 194 )
	OtherHasItemWidget0:setTopBottom( true, false, 192, 228 )
	OtherHasItemWidget0:setRGB( 1, 1, 1 )
	OtherHasItemWidget0:setAlpha( 0 )
	self:addElement( OtherHasItemWidget0 )
	self.OtherHasItemWidget0 = OtherHasItemWidget0
	
	local OtherHasItemWidget1 = CoD.OtherHasItemWidget.new( self, controller )
	OtherHasItemWidget1:setLeftRight( true, false, 15, 194 )
	OtherHasItemWidget1:setTopBottom( true, false, 228, 264 )
	OtherHasItemWidget1:setRGB( 1, 1, 1 )
	OtherHasItemWidget1:setAlpha( 0 )
	self:addElement( OtherHasItemWidget1 )
	self.OtherHasItemWidget1 = OtherHasItemWidget1
	
	local OtherHasItemWidget2 = CoD.OtherHasItemWidget.new( self, controller )
	OtherHasItemWidget2:setLeftRight( true, false, 15, 194 )
	OtherHasItemWidget2:setTopBottom( true, false, 264, 300 )
	OtherHasItemWidget2:setRGB( 1, 1, 1 )
	OtherHasItemWidget2:setAlpha( 0 )
	self:addElement( OtherHasItemWidget2 )
	self.OtherHasItemWidget2 = OtherHasItemWidget2
	
	local PlayerHasItemWidget0 = CoD.PlayerHasItemWidget.new( self, controller )
	PlayerHasItemWidget0:setLeftRight( false, true, -96, -24 )
	PlayerHasItemWidget0:setTopBottom( false, true, -170, -98 )
	PlayerHasItemWidget0:setRGB( 1, 1, 1 )
	PlayerHasItemWidget0:setAlpha( 0 )
	self:addElement( PlayerHasItemWidget0 )
	self.PlayerHasItemWidget0 = PlayerHasItemWidget0
	
	local PlayerHasItemWidget1 = CoD.PlayerHasItemWidget.new( self, controller )
	PlayerHasItemWidget1:setLeftRight( false, true, -168, -96 )
	PlayerHasItemWidget1:setTopBottom( false, true, -170, -98 )
	PlayerHasItemWidget1:setRGB( 1, 1, 1 )
	PlayerHasItemWidget1:setAlpha( 0 )
	self:addElement( PlayerHasItemWidget1 )
	self.PlayerHasItemWidget1 = PlayerHasItemWidget1
	
	local interactPromptContainer = CoD.DynamicContainerWidget.new( self, controller )
	interactPromptContainer:setLeftRight( false, false, -640, 640 )
	interactPromptContainer:setTopBottom( false, false, -360, 360 )
	interactPromptContainer:setRGB( 1, 1, 1 )
	self:addElement( interactPromptContainer )
	self.interactPromptContainer = interactPromptContainer
	
	local Notifications = CoD.Notification.new( self, controller )
	Notifications:setLeftRight( true, true, 0, 0 )
	Notifications:setTopBottom( true, true, 0, 0 )
	Notifications:setRGB( 1, 1, 1 )
	self:addElement( Notifications )
	self.Notifications = Notifications
	
	local ResourceEnergyBar = CoD.ResourceEnergyBar.new( self, controller )
	ResourceEnergyBar:setLeftRight( true, false, -300, -125 )
	ResourceEnergyBar:setTopBottom( true, false, 91.8, 171.8 )
	ResourceEnergyBar:setRGB( 1, 1, 1 )
	self:addElement( ResourceEnergyBar )
	self.ResourceEnergyBar = ResourceEnergyBar
	
	local WarlordArmorRegenerationBar = CoD.WarlordArmorRegenerationBar.new( self, controller )
	WarlordArmorRegenerationBar:setLeftRight( true, false, -300, -119 )
	WarlordArmorRegenerationBar:setTopBottom( true, false, 192, 267 )
	WarlordArmorRegenerationBar:setRGB( 1, 1, 1 )
	self:addElement( WarlordArmorRegenerationBar )
	self.WarlordArmorRegenerationBar = WarlordArmorRegenerationBar
	
	local ThrustMeter = CoD.ThrustMeter.new( self, controller )
	ThrustMeter:setLeftRight( false, false, -85, 85 )
	ThrustMeter:setTopBottom( false, false, 116, 156 )
	ThrustMeter:setRGB( 1, 1, 1 )
	self:addElement( ThrustMeter )
	self.ThrustMeter = ThrustMeter
	
	local Outcome = CoD.Outcome.new( self, controller )
	Outcome:setLeftRight( false, false, -640, 640 )
	Outcome:setTopBottom( false, false, -360, 360 )
	Outcome:setRGB( 1, 1, 1 )
	Outcome:setAlpha( 0 )
	self:addElement( Outcome )
	self.Outcome = Outcome
	
	local ThrustMeterBoot = CoD.ThrustMeterBootContainer.new( self, controller )
	ThrustMeterBoot:setLeftRight( false, false, -154.5, 154.5 )
	ThrustMeterBoot:setTopBottom( false, false, -150, 163 )
	ThrustMeterBoot:setRGB( 1, 1, 1 )
	ThrustMeterBoot:setAlpha( 0.7 )
	ThrustMeterBoot:registerEventHandler( "hud_boot", function ( element, event )
		local retVal = nil
		if ShouldBootUpHUD( self ) then
			PlayClipOnElement( self, {
				elementName = "ThrustMeterBoot",
				clipName = "thrust_boot"
			}, controller )
			SetHudHasBooted( self )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( ThrustMeterBoot )
	self.ThrustMeterBoot = ThrustMeterBoot
	
	local Console = CoD.Console.new( self, controller )
	Console:setLeftRight( true, false, 39, 809 )
	Console:setTopBottom( false, true, -326, -186 )
	Console:setRGB( 1, 1, 1 )
	Console:setXRot( 15 )
	Console:setYRot( 40 )
	self:addElement( Console )
	self.Console = Console
	
	local Stuck = CoD.Stuck.new( self, controller )
	Stuck:setLeftRight( false, false, -32, 32 )
	Stuck:setTopBottom( false, true, -240, -176 )
	Stuck:setRGB( 1, 1, 1 )
	Stuck:mergeStateConditions( {
		{
			stateName = "Stuck",
			condition = function ( menu, element, event )
				return IsStickyImageActive( controller )
			end
		}
	} )
	Stuck:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.stickyImage" ), function ( model )
		self:updateElementState( Stuck, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.stickyImage"
		} )
	end )
	self:addElement( Stuck )
	self.Stuck = Stuck
	
	local CursorHint = CoD.CursorHint.new( self, controller )
	CursorHint:setLeftRight( false, false, -250, 250 )
	CursorHint:setTopBottom( false, true, -218, -124 )
	CursorHint:setRGB( 1, 1, 1 )
	CursorHint:mergeStateConditions( {
		{
			stateName = "Active_1x1",
			condition = function ( menu, element, event )
				local f34_local0 = IsCursorHintActive( controller )
				if f34_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 1 then
						f34_local0 = false
					else
						f34_local0 = true
					end
				end
				return f34_local0
			end
		},
		{
			stateName = "Active_2x1",
			condition = function ( menu, element, event )
				local f35_local0 = IsCursorHintActive( controller )
				if f35_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 2 then
						f35_local0 = false
					else
						f35_local0 = true
					end
				end
				return f35_local0
			end
		},
		{
			stateName = "Active_4x1",
			condition = function ( menu, element, event )
				local f36_local0 = IsCursorHintActive( controller )
				if f36_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 4 then
						f36_local0 = false
					else
						f36_local0 = true
					end
				end
				return f36_local0
			end
		}
	} )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showCursorHint" ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showCursorHint"
		} )
	end )
	if CursorHint.m_eventHandlers.hud_update_refresh then
		local currentEv = CursorHint.m_eventHandlers.hud_update_refresh
		CursorHint:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		CursorHint:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING
		} )
	end )
	self:addElement( CursorHint )
	self.CursorHint = CursorHint
	
	local currentEv = CoD.ShockCharge.new( self, controller )
	currentEv:setLeftRight( false, false, -110.67, 110.67 )
	currentEv:setTopBottom( false, false, -114, 94 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "ShockTop",
			condition = function ( menu, element, event )
				return IsShockImageTopActive( controller )
			end
		},
		{
			stateName = "ShockLeft",
			condition = function ( menu, element, event )
				return IsShockImageLeftActive( controller )
			end
		},
		{
			stateName = "ShockRight",
			condition = function ( menu, element, event )
				return IsShockImageRightActive( controller )
			end
		},
		{
			stateName = "ShockBottom",
			condition = function ( menu, element, event )
				return IsShockImageBottomActive( controller )
			end
		}
	} )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.shockImageTop" ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.shockImageTop"
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.shockImageLeft" ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.shockImageLeft"
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.shockImageRight" ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.shockImageRight"
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.shockImageBottom" ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.shockImageBottom"
		} )
	end )
	self:addElement( currentEv )
	self.ShockCharge0 = currentEv
	
	local ConsoleCenter = CoD.Console.new( self, controller )
	ConsoleCenter:setLeftRight( true, false, 521.5, 1201.5 )
	ConsoleCenter:setTopBottom( true, false, 64, 162 )
	ConsoleCenter:setRGB( 1, 1, 1 )
	self:addElement( ConsoleCenter )
	self.ConsoleCenter = ConsoleCenter
	
	local Top3PlayersScreenWidget = CoD.Top3PlayersScreenWidget.new( self, controller )
	Top3PlayersScreenWidget:setLeftRight( false, false, -640, 640 )
	Top3PlayersScreenWidget:setTopBottom( false, false, -360, 360 )
	Top3PlayersScreenWidget:setRGB( 1, 1, 1 )
	Top3PlayersScreenWidget:setAlpha( 0 )
	self:addElement( Top3PlayersScreenWidget )
	self.Top3PlayersScreenWidget = Top3PlayersScreenWidget
	
	local proximityAlarm = CoD.ProximityAlarm.new( self, controller )
	proximityAlarm:setLeftRight( false, false, -125, 125 )
	proximityAlarm:setTopBottom( false, false, 72, 104 )
	proximityAlarm:setRGB( 1, 1, 1 )
	self:addElement( proximityAlarm )
	self.proximityAlarm = proximityAlarm
	
	self:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "hud_boot", function ( element, event )
		local retVal = nil
		if ShouldBootUpHUD( self ) then
			PlaySoundSetSound( self, "hud_boot" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "player_spawned", function ( element, event )
		local retVal = nil
		if IsInPrematchPeriod() then
			TryBootHUD( self, "1000" )
		elseif not IsInPrematchPeriod() then
			TryBootHUD( self, "0" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	self.close = function ( self )
		self.ArmorOverlayContainer0:close()
		self.vignettecornerright0:close()
		self.vignettecornerL:close()
		self.WaypointBase:close()
		self.OtherHasItemWidget0:close()
		self.OtherHasItemWidget1:close()
		self.OtherHasItemWidget2:close()
		self.PlayerHasItemWidget0:close()
		self.PlayerHasItemWidget1:close()
		self.interactPromptContainer:close()
		self.Notifications:close()
		self.ResourceEnergyBar:close()
		self.WarlordArmorRegenerationBar:close()
		self.ThrustMeter:close()
		self.Outcome:close()
		self.ThrustMeterBoot:close()
		self.Console:close()
		self.Stuck:close()
		self.CursorHint:close()
		self.ShockCharge0:close()
		self.ConsoleCenter:close()
		self.Top3PlayersScreenWidget:close()
		self.proximityAlarm:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

