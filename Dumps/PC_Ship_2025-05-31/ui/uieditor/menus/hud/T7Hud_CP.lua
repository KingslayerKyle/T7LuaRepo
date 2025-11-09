require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidget_PanelVignetteRight" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetContainer" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetContainer" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetEMP" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetEMP" )
require( "ui.uieditor.widgets.CPSystems.CommsSystem.CommsSystemWidget" )
require( "ui.uieditor.widgets.DynamicContainerWidget" )
require( "ui.uieditor.widgets.HUD.CP_PartyList.PartyListContainerParent" )
require( "ui.uieditor.widgets.CPSystems.TacticalMode.RepulsorIndicator" )
require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardWidgetCP" )
require( "ui.uieditor.widgets.Chat.inGame.IngameChatClientContainer" )
require( "ui.uieditor.widgets.CPSystems.EnemyTarget.EnemyTargetInternal" )
require( "ui.uieditor.widgets.CPSystems.IncomingExplosive.IncomingExplosiveInternal" )
require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedOutWidget" )
require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeCounter.SpikeLauncherSpikeCounter" )
require( "ui.uieditor.widgets.CPSystems.TacticalMode.TacticalModeWidget" )
require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpointIndicator" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "playerAbilities.repulsorIndicatorDirection" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "playerAbilities.repulsorIndicatorIntensity" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "playerAbilities.proximityIndicatorDirection" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "playerAbilities.proximityIndicatorIntensity" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	local f2_local0 = DataSources.WorldSpaceIndicators.getModel( f2_arg1 )
	local f2_local1 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		local f3_local0 = Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "WorldSpaceIndicators" )
		if f3_local0 then
			local f3_local1 = Engine.CreateModel( f3_local0, "weakpoint_" .. f3_arg0 .. "_" .. f3_arg1 )
			if f3_local1 then
				LUI.CreateModelAndInitialize( f3_local1, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_DEFAULT )
				local f3_local2 = CoD.weakpointIndicator.new( f2_arg0, f2_arg1 )
				f3_local2:setModel( f3_local1 )
				f3_local2:setupWeakpointIndicator( f2_arg1, f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
				LUI.OverrideFunction_CallOriginalFirst( f3_local2, "close", function ()
					Engine.UnsubscribeAndFreeModel( f3_local1 )
				end )
				return f3_local2
			end
		end
	end
	
	f2_arg0.weakpoints = {}
	f2_arg0:subscribeToGlobalModel( f2_arg1, "PerController", "scriptNotify", function ( model )
		local modelValue = Engine.GetModelValue( model )
		local f5_local1 = {
			controller = f2_arg1,
			name = modelValue,
			data = CoD.GetScriptNotifyData( model )
		}
		if modelValue == "weakpoint_update" then
			local f5_local2 = f5_local1.data[2]
			local f5_local3 = Engine.GetIString( f5_local1.data[3], "CS_LOCALIZED_STRINGS" )
			if f5_local1.data[1] == 0 then
				if f2_arg0.weakpoints[f5_local2] and f2_arg0.weakpoints[f5_local2][f5_local3] then
					local f5_local4 = f2_arg0.weakpoints[f5_local2][f5_local3]:getModel( f2_arg1, "status" )
					if f5_local4 then
						Engine.SetModelValue( f5_local4, Enum.WeakpointWidgetStates.WEAKPOINT_STATE_CLOSING )
					end
					local f5_local5 = f2_arg0.weakpoints[f5_local2][f5_local3]
					f5_local5:addElement( LUI.UITimer.newElementTimer( 1500, true, f5_local5.close, f5_local5 ) )
					f2_arg0.weakpoints[f5_local2][f5_local3] = nil
				end
			elseif f5_local1.data[1] == 1 then
				if not f2_arg0.weakpoints[f5_local2] then
					f2_arg0.weakpoints[f5_local2] = {}
				end
				if not f2_arg0.weakpoints[f5_local2][f5_local3] then
					local f5_local6 = f2_local1( f5_local2, f5_local3, f5_local1.data[4], f5_local1.data[5] )
					if f5_local6 then
						f2_arg0.weakpoints[f5_local2][f5_local3] = f5_local6
						f2_arg0.fullscreenContainer:addElement( f5_local6 )
						f5_local6:processEvent( {
							name = "update_state",
							controller = f2_arg1,
							menu = f2_arg0
						} )
					end
				end
			elseif f5_local1.data[1] == 2 then
				if f2_arg0.weakpoints[f5_local2] and f2_arg0.weakpoints[f5_local2][f5_local3] then
					f2_arg0.weakpoints[f5_local2][f5_local3]:playClip( "Damaged" )
				end
			elseif f5_local1.data[1] == 3 and f2_arg0.weakpoints[f5_local2] and f2_arg0.weakpoints[f5_local2][f5_local3] then
				f2_arg0.weakpoints[f5_local2][f5_local3]:playClip( "Repulsed" )
			end
			return true
		else
			
		end
	end )
	if f2_local0 then
		Engine.SetModelValue( Engine.CreateModel( f2_local0, "hackingPercent" ), 0 )
		local f2_local2 = {
			{
				name = "targetState",
				defaultValue = Enum.EnemyTargetStates.ENEMY_TARGET_NONE
			}
		}
		local f2_local3 = 0
		local f2_local4 = true
		while f2_local4 do
			local f2_local5 = Engine.CreateModel( f2_local0, "enemyTargets." .. f2_local3 )
			for f2_local9, f2_local10 in ipairs( f2_local2 ) do
				LUI.CreateModelAndInitialize( f2_local5, f2_local10.name, f2_local10.defaultValue )
			end
			f2_local6 = CoD.EnemyTargetInternal.new( f2_arg0, f2_arg1 )
			f2_local6:setModel( f2_local5 )
			f2_local4 = f2_local6:setupCybercomLockon( f2_local3, f2_arg1 )
			f2_arg0.fullscreenContainer:addElement( f2_local6 )
			f2_local6:processEvent( {
				name = "update_state",
				controller = f2_arg1
			} )
			f2_local3 = f2_local3 + 1
		end
	end
	if f2_local0 then
		local f2_local2 = {
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
		local f2_local3 = 0
		local f2_local4 = true
		while f2_local4 do
			local f2_local5 = Engine.CreateModel( f2_local0, "explosivesWarnings." .. f2_local3 )
			for f2_local9, f2_local10 in ipairs( f2_local2 ) do
				LUI.CreateModelAndInitialize( f2_local5, f2_local10.name, f2_local10.defaultValue )
			end
			f2_local6 = CoD.IncomingExplosiveInternal.new( f2_arg0, f2_arg1 )
			f2_local6:setModel( f2_local5 )
			f2_local6:setPriority( 100 )
			f2_local4 = f2_local6:setupIncomingExplosive( f2_local3, f2_arg1 )
			f2_arg0.fullscreenContainer:addElement( f2_local6 )
			f2_local6:processEvent( {
				name = "update_state",
				controller = f2_arg1
			} )
			f2_local3 = f2_local3 + 1
		end
	end
	CoD.TacticalModeUtility.CreateTacticalModeWidgets( f2_arg0, f2_arg1 )
	CoD.TacticalModeUtility.CreateShooterSpottedWidgets( f2_arg0, f2_arg1 )
	if Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "currentWeapon.viewmodelWeaponName" ) ~= nil then
		f2_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "currentWeapon.viewmodelWeaponName" ), function ( model )
			if IsCurrentViewmodelWeaponName( f2_arg1, "spike_launcher" ) then
				f2_arg0.spikeLauncherCounter = CoD.SpikeLauncherSpikeCounter.new( f2_arg0, f2_arg1 )
				f2_arg0:addElement( f2_arg0.spikeLauncherCounter )
				f2_arg0.spikeLauncherCounter:dispatchEventToChildren( {
					name = "update_state",
					controller = f2_arg1
				} )
			elseif f2_arg0.spikeLauncherCounter ~= nil then
				f2_arg0.spikeLauncherCounter:close()
				f2_arg0.spikeLauncherCounter = nil
			end
		end )
	end
	local f2_local2 = f2_arg0.close
	f2_arg0.close = function ( f7_arg0 )
		f2_local2( f7_arg0 )
		if f7_arg0.spikeLauncherCounter ~= nil then
			f7_arg0.spikeLauncherCounter:close()
		end
	end
	
	if f2_local0 then
		local f2_local3 = function ( f8_arg0 )
			local f8_local0 = f8_arg0:getFirstChild()
			while f8_local0 do
				if LUI.startswith( f8_local0.id, "bleedOutItem" ) then
					local f8_local1 = f8_local0:getModel( f2_arg1, "playerName" )
					if f8_local1 then
						Engine.SetModelValue( f8_local1, Engine.GetGamertagForClient( f2_arg1, f8_local0.bleedOutClient ) )
					end
				end
				f8_local0 = f8_local0:getNextSibling()
			end
		end
		
		local f2_local4 = 0
		local f2_local5 = true
		while f2_local5 do
			local f2_local6 = Engine.CreateModel( f2_local0, "bleedOutModel" .. f2_local4 )
			Engine.SetModelValue( Engine.CreateModel( f2_local6, "playerName" ), Engine.GetGamertagForClient( f2_arg1, f2_local4 ) )
			Engine.SetModelValue( Engine.CreateModel( f2_local6, "prompt" ), "CPUI_REVIVE" )
			Engine.SetModelValue( Engine.CreateModel( f2_local6, "clockPercent" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f2_local6, "bleedOutPercent" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f2_local6, "stateFlags" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f2_local6, "arrowAngle" ), 0 )
			local f2_local8 = CoD.bleedOutWidget.new( f2_arg0, f2_arg1 )
			f2_local8.bleedOutClient = f2_local4
			f2_local8.id = "bleedOutItem" .. f2_local4
			f2_local8:setLeftRight( true, false, 0, 0 )
			f2_local8:setTopBottom( true, false, 0, 0 )
			f2_local8:setModel( f2_local6 )
			f2_local5 = f2_local8:setupBleedOutWidget( f2_arg1, f2_local4 )
			f2_arg0.fullscreenContainer:addElement( f2_local8 )
			f2_arg0.fullscreenContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "playerConnected" ), function ( model )
				f2_local3( f2_arg0.fullscreenContainer )
			end )
			f2_local4 = f2_local4 + 1
		end
	end
	f2_arg0.m_inputDisabled = true
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "T7Hud_CP.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local PanelVignetteRight = CoD.MapWidget_PanelVignetteRight.new( self, controller )
	PanelVignetteRight:setLeftRight( false, false, 88, 660 )
	PanelVignetteRight:setTopBottom( false, false, -362, 54 )
	PanelVignetteRight:setAlpha( 0 )
	self:addElement( PanelVignetteRight )
	self.PanelVignetteRight = PanelVignetteRight
	
	local DamageWidgetContainer = CoD.DamageWidgetContainer.new( self, controller )
	DamageWidgetContainer:setLeftRight( true, false, 18, 284 )
	DamageWidgetContainer:setTopBottom( false, true, -132, -26 )
	self:addElement( DamageWidgetContainer )
	self.DamageWidgetContainer = DamageWidgetContainer
	
	local AmmoWidgetContainer = CoD.AmmoWidgetContainer.new( self, controller )
	AmmoWidgetContainer:setLeftRight( false, true, -421, -23 )
	AmmoWidgetContainer:setTopBottom( false, true, -156, -32 )
	self:addElement( AmmoWidgetContainer )
	self.AmmoWidgetContainer = AmmoWidgetContainer
	
	local EMPWeaponInfo = CoD.AmmoWidgetEMP.new( self, controller )
	EMPWeaponInfo:setLeftRight( false, true, -341, 0 )
	EMPWeaponInfo:setTopBottom( false, true, -171, 0 )
	self:addElement( EMPWeaponInfo )
	self.EMPWeaponInfo = EMPWeaponInfo
	
	local EMPScoreInfo = CoD.DamageWidgetEMP.new( self, controller )
	EMPScoreInfo:setLeftRight( true, false, 0, 341 )
	EMPScoreInfo:setTopBottom( false, true, -171, 0 )
	self:addElement( EMPScoreInfo )
	self.EMPScoreInfo = EMPScoreInfo
	
	local CommsSystemWidget = CoD.CommsSystemWidget.new( self, controller )
	CommsSystemWidget:setLeftRight( false, true, -420, -20 )
	CommsSystemWidget:setTopBottom( true, false, 32, 532 )
	CommsSystemWidget:setXRot( -17 )
	CommsSystemWidget:setYRot( -21 )
	self:addElement( CommsSystemWidget )
	self.CommsSystemWidget = CommsSystemWidget
	
	local fullscreenContainer = CoD.DynamicContainerWidget.new( self, controller )
	fullscreenContainer:setLeftRight( false, false, -640, 640 )
	fullscreenContainer:setTopBottom( false, false, -360, 360 )
	self:addElement( fullscreenContainer )
	self.fullscreenContainer = fullscreenContainer
	
	local PartyListContainerParent0 = CoD.PartyListContainerParent.new( self, controller )
	PartyListContainerParent0:setLeftRight( false, true, -289, -23 )
	PartyListContainerParent0:setTopBottom( false, true, -244, -132 )
	PartyListContainerParent0:registerEventHandler( "hud_boot", function ( element, event )
		local f11_local0 = nil
		if not f11_local0 then
			f11_local0 = element:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	self:addElement( PartyListContainerParent0 )
	self.PartyListContainerParent0 = PartyListContainerParent0
	
	local RepulsorIndicator = CoD.RepulsorIndicator.new( self, controller )
	RepulsorIndicator:setLeftRight( false, false, -96, 96 )
	RepulsorIndicator:setTopBottom( false, false, -192, 192 )
	RepulsorIndicator.IndicatorOn:setImage( RegisterImage( "uie_t7_hud_hit_direction_yellow_on" ) )
	RepulsorIndicator.IndicatorGlow:setImage( RegisterImage( "uie_t7_hud_hit_direction_glow_yellow" ) )
	RepulsorIndicator:subscribeToGlobalModel( controller, "PlayerAbilities", "repulsorIndicatorDirection", function ( model )
		local repulsorIndicatorDirection = Engine.GetModelValue( model )
		if repulsorIndicatorDirection then
			RepulsorIndicator:setZRot( Multiple( 90, repulsorIndicatorDirection ) )
		end
	end )
	RepulsorIndicator:mergeStateConditions( {
		{
			stateName = "Glow",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "playerAbilities.repulsorIndicatorIntensity", 2 )
			end
		},
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "playerAbilities.repulsorIndicatorIntensity", 1 )
			end
		}
	} )
	RepulsorIndicator:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.repulsorIndicatorIntensity" ), function ( model )
		self:updateElementState( RepulsorIndicator, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.repulsorIndicatorIntensity"
		} )
	end )
	self:addElement( RepulsorIndicator )
	self.RepulsorIndicator = RepulsorIndicator
	
	local ProximityIndicator = CoD.RepulsorIndicator.new( self, controller )
	ProximityIndicator:setLeftRight( false, false, -96, 96 )
	ProximityIndicator:setTopBottom( false, false, -192, 192 )
	ProximityIndicator:subscribeToGlobalModel( controller, "PlayerAbilities", "proximityIndicatorDirection", function ( model )
		local proximityIndicatorDirection = Engine.GetModelValue( model )
		if proximityIndicatorDirection then
			ProximityIndicator:setZRot( Multiple( 90, proximityIndicatorDirection ) )
		end
	end )
	ProximityIndicator:mergeStateConditions( {
		{
			stateName = "Glow",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "playerAbilities.proximityIndicatorIntensity", 2 )
			end
		},
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "playerAbilities.proximityIndicatorIntensity", 1 )
			end
		}
	} )
	ProximityIndicator:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.proximityIndicatorIntensity" ), function ( model )
		self:updateElementState( ProximityIndicator, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.proximityIndicatorIntensity"
		} )
	end )
	self:addElement( ProximityIndicator )
	self.ProximityIndicator = ProximityIndicator
	
	local ScoreboardWidgetCP = CoD.ScoreboardWidgetCP.new( self, controller )
	ScoreboardWidgetCP:setLeftRight( false, false, -503, 503 )
	ScoreboardWidgetCP:setTopBottom( true, false, 97, 623 )
	self:addElement( ScoreboardWidgetCP )
	self.ScoreboardWidgetCP = ScoreboardWidgetCP
	
	local IngameChatClientContainer = CoD.IngameChatClientContainer.new( self, controller )
	IngameChatClientContainer:setLeftRight( true, false, 0, 360 )
	IngameChatClientContainer:setTopBottom( true, false, -2.5, 717.5 )
	self:addElement( IngameChatClientContainer )
	self.IngameChatClientContainer = IngameChatClientContainer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Prologue = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				AmmoWidgetContainer:completeAnimation()
				AmmoWidgetContainer.AmmoWidget:completeAnimation()
				self.AmmoWidgetContainer.AmmoWidget:setXRot( 0 )
				self.AmmoWidgetContainer.AmmoWidget:setYRot( 0 )
				self.clipFinished( AmmoWidgetContainer, {} )
				CommsSystemWidget:completeAnimation()
				self.CommsSystemWidget:setLeftRight( false, true, -414, -14 )
				self.CommsSystemWidget:setTopBottom( true, false, 36, 536 )
				self.CommsSystemWidget:setXRot( 0 )
				self.CommsSystemWidget:setYRot( 0 )
				self.clipFinished( CommsSystemWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Prologue",
			condition = function ( menu, element, event )
				return HideCyberCoreWidget( controller )
			end
		}
	} )
	ScoreboardWidgetCP.id = "ScoreboardWidgetCP"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ScoreboardWidgetCP:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelVignetteRight:close()
		element.DamageWidgetContainer:close()
		element.AmmoWidgetContainer:close()
		element.EMPWeaponInfo:close()
		element.EMPScoreInfo:close()
		element.CommsSystemWidget:close()
		element.fullscreenContainer:close()
		element.PartyListContainerParent0:close()
		element.RepulsorIndicator:close()
		element.ProximityIndicator:close()
		element.ScoreboardWidgetCP:close()
		element.IngameChatClientContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "T7Hud_CP.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

