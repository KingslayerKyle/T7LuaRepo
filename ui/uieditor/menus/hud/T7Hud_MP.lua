-- 5cf8b11614b59b03ada1dd4118b75d96
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.SafeAreaContainers.T7Hud_MP_SafeAreaContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.ReadyEvents.ReadyEvents" )
require( "ui.uieditor.widgets.MPHudWidgets.ScorePopup.MPScr" )
require( "ui.uieditor.widgets.DynamicContainerWidget" )
require( "ui.uieditor.widgets.MP.MPDamageFeedback" )
require( "ui.uieditor.widgets.HUD.Outcome.Outcome" )
require( "ui.uieditor.widgets.EndGameFlow.Top3PlayersScreenWidget" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardWidget" )
require( "ui.uieditor.widgets.Chat.inGame.IngameChatClientContainer" )
require( "ui.uieditor.widgets.Scorestreaks.CallingScorestreaks.ArmDeviceWidget" )
require( "ui.uieditor.widgets.Scorestreaks.CallingScorestreaks.GenericProjectedTablet" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.combat_efficiency_enabled" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0:registerEventHandler( "gain_focus", function ( element, event )
		element.SafeAreaContainer.ScrStkContainer.ScrStkButtons:processEvent( event )
	end )
	f2_arg0:registerEventHandler( "gamepad_button", function ( element, event )
		if element.ScoreboardWidget.m_inputDisabled ~= false then
			element.SafeAreaContainer.ScrStkContainer.ScrStkButtons:processEvent( event )
		else
			element.ScoreboardWidget:processEvent( event )
		end
	end )
	if Engine.IsVisibilityBitSet( f2_arg1, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) then
		f2_arg0.SafeAreaContainer.ScrStkContainer.ScrStkButtons:registerEventHandler( "list_item_gain_focus", function ( element, event )
			local f5_local0 = element.gridInfoTable.zeroBasedIndex
			if f5_local0 ~= nil then
				local f5_local1 = CoD.SafeGetModelValue( Engine.GetModelForController( f2_arg1 ), "killstreaks.killstreak" .. CoD.CACUtility.maxScorestreaks - 1 - f5_local0 .. ".rewardName" )
				if f5_local1 ~= nil and f5_local1 ~= "" then
					f2_arg0.SafeAreaContainer.MPHardcoreInventoryWidget.HardcoreScorestreakWidget.text:setText( f5_local1 )
					f2_arg0.SafeAreaContainer.MPHardcoreInventoryWidget.HardcoreScorestreakWidget:playClip( "Show" )
				end
			end
		end )
	end
	local f2_local0 = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if f6_arg0.ScoreboardWidget.m_inputDisabled ~= false then
			if not f6_arg0.SafeAreaContainer.ScrStkContainer.ScrStkButtons.m_disableNavigation then
				f6_arg0.SafeAreaContainer.ScrStkContainer:processEvent( {
					name = "gain_focus",
					controller = f6_arg1
				} )
			end
			if not f6_arg0.handlingScrStkPress then
				f6_arg0.handlingScrStkPress = true
				CoD.Menu.HandleButtonPress( f6_arg0, f6_arg1, f6_arg3, f6_arg2 )
				f6_arg0.handlingScrStkPress = nil
			end
		end
	end
	
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		f2_local0( f7_arg1, f7_arg2, f7_arg3, Enum.LUIButton.LUI_KEY_RIGHT )
		return true
	end, AlwaysFalse, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_UP, nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		f2_local0( f8_arg1, f8_arg2, f8_arg3, Enum.LUIButton.LUI_KEY_UP )
		return true
	end, AlwaysFalse, false )
	f2_arg0:AddButtonCallbackFunction( f2_arg0, f2_arg1, Enum.LUIButton.LUI_KEY_DOWN, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		f2_local0( f9_arg1, f9_arg2, f9_arg3, Enum.LUIButton.LUI_KEY_DOWN )
		return true
	end, AlwaysFalse, false )
	local f2_local1 = function ()
		local f10_local0 = f2_arg0.SafeAreaContainer.ScrStkContainer.ScrStkButtons
		local f10_local1 = Engine.IsVisibilityBitSet( f2_arg1, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT )
		if not f10_local1 then
			f10_local1 = Engine.IsVisibilityBitSet( f2_arg1, Enum.UIVisibilityBit.BIT_GAME_ENDED )
		end
		f10_local0.m_disableNavigation = f10_local1
	end
	
	f2_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		f2_local1()
	end )
	f2_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		f2_local1()
	end )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f2_arg1 ), "hudItems.rejack.activationWindowEntered" ), function ( model )
		if model and Engine.GetModelValue( model ) == 0 and f2_arg0.rejackWidget then
			f2_arg0.rejackWidget:close()
			f2_arg0.rejackWidget = nil
		end
	end )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f2_arg1 ), "hudItems.rejack.rejackActivated" ), function ( model )
		if model and Engine.GetModelValue( model ) == 1 and f2_arg0.rejackWidget then
			f2_arg0.rejackWidget.RejackInternal:startRejackAnimation( f2_arg1 )
		end
	end )
	f2_arg0:subscribeToGlobalModel( f2_arg1, "PerController", "scriptNotify", function ( model )
		if IsParamModelEqualToString( model, "create_rejack_timer" ) then
			CreateRejackTimer( f2_arg0, f2_arg1, model )
		end
	end )
	local f2_local2 = DataSources.CurrentWeapon.getModel( f2_arg1 )
	if f2_local2 then
		Engine.CreateModel( f2_local2, "weaponPrestigeUI3DText" )
	end
	f2_arg0:subscribeToGlobalModel( f2_arg1, "CurrentWeapon", "weaponPrestigeUI3DText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue and modelValue ~= "" then
			if not f2_arg0.weaponPrestigeWidget then
				f2_arg0.weaponPrestigeWidget = CoD.prestigeRewardWidget_v2.new( f2_arg0, f2_arg1 )
				f2_arg0:addElement( f2_arg0.weaponPrestigeWidget )
			end
		elseif f2_arg0.weaponPrestigeWidget then
			f2_arg0.weaponPrestigeWidget:close()
			f2_arg0.weaponPrestigeWidget = nil
		end
	end )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f2_arg1 ), "hudItems.killstreakActivated" ), function ( model )
		if Engine.GetModelValue( model ) == 1 and not f2_arg0.ArmDeviceWidget then
			f2_arg0.delayUI3DTimer = LUI.UITimer.newElementTimer( 0, true, function ()
				f2_arg0.delayUI3DTimer = nil
				f2_arg0.ArmDeviceWidget = CoD.ArmDeviceWidget.new( f2_arg0, f2_arg1 )
				f2_arg0:addElement( f2_arg0.ArmDeviceWidget )
				f2_arg0.ArmDeviceWidget.ArmDeviceWidgetInternal:playClip( "Activate" )
			end )
			f2_arg0:addElement( f2_arg0.delayUI3DTimer )
		elseif f2_arg0.ArmDeviceWidget then
			f2_arg0.ArmDeviceWidget.ArmDeviceWidgetInternal:playClip( "Deactivate" )
			f2_arg0.ArmDeviceWidget.ArmDeviceWidgetInternal:registerEventHandler( "clip_over", function ( element, event )
				f2_arg0.ArmDeviceWidget:close()
				f2_arg0.ArmDeviceWidget = nil
			end )
		end
	end )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f2_arg1 ), "hudItems.remoteKillstreakActivated" ), function ( model )
		if Engine.GetModelValue( model ) == 1 and not Engine.IsVisibilityBitSet( f2_arg1, Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ) then
			f2_arg0.genericProjectedTablet = CoD.GenericProjectedTablet.new( f2_arg0, f2_arg1 )
			f2_arg0.genericProjectedTablet.GenericProjectedTabletInternal:setState( "DefaultState" )
			f2_arg0:addElement( f2_arg0.genericProjectedTablet )
		elseif f2_arg0.genericProjectedTablet then
			f2_arg0.genericProjectedTablet:close()
			f2_arg0.genericProjectedTablet = nil
		end
	end )
	local f2_local3 = 6
	if Engine.GetCurrentTeamCount() > 1 then
		f2_local3 = math.max( Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_ALLIES ), Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_AXIS ) )
	end
	if f2_local3 > 6 then
		f2_arg0.ScoreboardWidget:setTopBottom( true, false, 120, 684 )
	end
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f2_arg1 ), "updateScoreboard" ), function ( model )
		CoD.ScoreboardUtility.UpdateScoreboardTeamScores( f2_arg1 )
	end )
	f2_arg0.SafeAreaContainer.navigation = nil
	f2_arg0.ScoreboardWidget.navigation = nil
	f2_arg0:subscribeToGlobalModel( f2_arg1, "PerController", "playerAbilities.playerGadget3.name", function ( model )
		if f2_arg0.armbladeOpenSubscription then
			f2_arg0:removeSubscription( f2_arg0.armbladeOpenSubscription )
			f2_arg0.armbladeOpenSubscription = nil
		end
		if f2_arg0.armbladeCloseSubscription then
			f2_arg0:removeSubscription( f2_arg0.armbladeCloseSubscription )
			f2_arg0.armbladeCloseSubscription = nil
			if f2_arg0.armbladeReticles then
				for f22_local3, f22_local4 in ipairs( f2_arg0.armbladeReticles ) do
					f22_local4:close()
				end
				f2_arg0.armbladeReticles = nil
			end
		end
		if model and Engine.GetModelValue( model ) == "WEAPON_HERO_ARMBLADE" then
			f2_arg0.armbladeCloseSubscription = f2_arg0:subscribeToGlobalModel( f2_arg1, "PerController", "playerAbilities.playerGadget3.isInUse", function ( model )
				if not Engine.GetModelValue( model ) and f2_arg0.armbladeReticles then
					for f23_local3, f23_local4 in ipairs( f2_arg0.armbladeReticles ) do
						f23_local4:close()
					end
					f2_arg0.armbladeReticles = nil
					f23_local0 = Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "ArmbladeReticles" )
					if f23_local0 then
						Engine.UnsubscribeAndFreeModel( f23_local0 )
					end
				end
			end )
			f2_arg0.armbladeOpenSubscription = f2_arg0:subscribeToGlobalModel( f2_arg1, "PerController", "playerAbilities.playerGadget3.powerRatio", function ( model )
				if Engine.GetModelValue( model ) >= 1 and not f2_arg0.armbladeReticles then
					local f24_local0 = Engine.CreateModel( Engine.GetModelForController( f2_arg1 ), "ArmbladeReticles" )
					f2_arg0.armbladeReticles = {}
					local f24_local1 = true
					local f24_local2 = 0
					while f24_local1 do
						local f24_local3 = CoD.RipperLockReticle.new( f2_arg0, f2_arg1 )
						local f24_local4 = Engine.CreateModel( f24_local0, #f2_arg0.armbladeReticles )
						LUI.CreateModelsAndInitialize( f24_local4, {
							status = 0
						} )
						f24_local3:setModel( f24_local4 )
						f24_local3:processEvent( {
							name = "update_state",
							controller = f2_arg1,
							menu = f2_arg0
						} )
						f24_local1 = f24_local3:setupArmBladeTarget( f2_arg1, #f2_arg0.armbladeReticles )
						table.insert( f2_arg0.armbladeReticles, f24_local3 )
						f2_arg0.fullscreenContainer:addElement( f24_local3 )
					end
				end
			end )
		end
	end )
end

LUI.createMenu.T7Hud_MP = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_MP" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "T7Hud_MP.buttonPrompts" )
	local f25_local1 = self
	self.anyChildUsesUpdateState = true
	
	local SafeAreaContainer = CoD.T7Hud_MP_SafeAreaContainer.new( f25_local1, controller )
	SafeAreaContainer:setLeftRight( false, false, -640, 640 )
	SafeAreaContainer:setTopBottom( false, false, -360, 360 )
	SafeAreaContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f26_local0 = nil
		SizeToSafeArea( element, controller )
		if not f26_local0 then
			f26_local0 = element:dispatchEventToChildren( event )
		end
		return f26_local0
	end )
	self:addElement( SafeAreaContainer )
	self.SafeAreaContainer = SafeAreaContainer
	
	local ReadyEvents = CoD.ReadyEvents.new( f25_local1, controller )
	ReadyEvents:setLeftRight( false, false, -200, 200 )
	ReadyEvents:setTopBottom( false, true, -178, -58 )
	ReadyEvents:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f27_local0 = ReadyEvents
		if IsParamModelEqualToString( model, "hero_weapon_received" ) then
			AddHeroAbilityReceivedNotification( self, f27_local0, controller, model )
		elseif IsParamModelEqualToString( model, "killstreak_received" ) then
			AddKillstreakReceivedNotification( self, f27_local0, controller, model )
		end
	end )
	self:addElement( ReadyEvents )
	self.ReadyEvents = ReadyEvents
	
	local MPScore = CoD.MPScr.new( f25_local1, controller )
	MPScore:setLeftRight( false, false, -50, 50 )
	MPScore:setTopBottom( true, false, 233.5, 258.5 )
	MPScore:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f28_local0 = MPScore
		if IsParamModelEqualToString( model, "score_event" ) and HasPerk( controller, "specialty_combat_efficiency" ) then
			PlayClipOnElement( self, {
				elementName = "MPScore",
				clipName = "CombatEfficiencyScore"
			}, controller )
			SetMPScoreText( f25_local1, f28_local0, controller, model )
		elseif IsParamModelEqualToString( model, "score_event" ) then
			PlayClipOnElement( self, {
				elementName = "MPScore",
				clipName = "NormalScore"
			}, controller )
			SetMPScoreText( f25_local1, f28_local0, controller, model )
		end
	end )
	self:addElement( MPScore )
	self.MPScore = MPScore
	
	local fullscreenContainer = CoD.DynamicContainerWidget.new( f25_local1, controller )
	fullscreenContainer:setLeftRight( true, true, 0, 0 )
	fullscreenContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( fullscreenContainer )
	self.fullscreenContainer = fullscreenContainer
	
	local MPDamageFeedback0 = CoD.MPDamageFeedback.new( f25_local1, controller )
	MPDamageFeedback0:setLeftRight( false, false, -20, 20 )
	MPDamageFeedback0:setTopBottom( false, false, -20, 20 )
	MPDamageFeedback0:subscribeToGlobalModel( controller, "CurrentWeapon", nil, function ( model )
		MPDamageFeedback0:setModel( model, controller )
	end )
	self:addElement( MPDamageFeedback0 )
	self.MPDamageFeedback0 = MPDamageFeedback0
	
	local Outcome = CoD.Outcome.new( f25_local1, controller )
	Outcome:setLeftRight( true, true, 0, 0 )
	Outcome:setTopBottom( true, true, 0, 0 )
	Outcome:setAlpha( 0 )
	self:addElement( Outcome )
	self.Outcome = Outcome
	
	local Top3PlayersScreenWidget = CoD.Top3PlayersScreenWidget.new( f25_local1, controller )
	Top3PlayersScreenWidget:setLeftRight( true, true, 0, 0 )
	Top3PlayersScreenWidget:setTopBottom( true, true, 0, 0 )
	Top3PlayersScreenWidget:setAlpha( 0 )
	self:addElement( Top3PlayersScreenWidget )
	self.Top3PlayersScreenWidget = Top3PlayersScreenWidget
	
	local ScoreboardWidget = CoD.ScoreboardWidget.new( f25_local1, controller )
	ScoreboardWidget:setLeftRight( false, false, -518, 488 )
	ScoreboardWidget:setTopBottom( true, false, 163.5, 806.5 )
	self:addElement( ScoreboardWidget )
	self.ScoreboardWidget = ScoreboardWidget
	
	local IngameChatClientContainer = CoD.IngameChatClientContainer.new( f25_local1, controller )
	IngameChatClientContainer:setLeftRight( true, false, 0, 360 )
	IngameChatClientContainer:setTopBottom( true, false, -2.5, 717.5 )
	self:addElement( IngameChatClientContainer )
	self.IngameChatClientContainer = IngameChatClientContainer
	
	SafeAreaContainer.navigation = {
		left = ScoreboardWidget,
		down = ScoreboardWidget
	}
	Top3PlayersScreenWidget.navigation = {
		left = ScoreboardWidget,
		down = ScoreboardWidget
	}
	ScoreboardWidget.navigation = {
		up = {
			SafeAreaContainer,
			Top3PlayersScreenWidget
		},
		right = {
			SafeAreaContainer,
			Top3PlayersScreenWidget
		}
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ReadyEvents:completeAnimation()
				self.ReadyEvents:setAlpha( 1 )
				self.clipFinished( ReadyEvents, {} )
				MPScore:completeAnimation()
				self.MPScore:setAlpha( 1 )
				self.clipFinished( MPScore, {} )
			end,
			SpeedBoost = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		HideAllButScoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ReadyEvents:completeAnimation()
				self.ReadyEvents:setAlpha( 0 )
				self.clipFinished( ReadyEvents, {} )
				MPScore:completeAnimation()
				self.MPScore:setAlpha( 0 )
				self.clipFinished( MPScore, {} )
			end
		},
		SpeedBoost = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		HideForCodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				MPScore:completeAnimation()
				self.MPScore:setAlpha( 0 )
				self.clipFinished( MPScore, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HideAllButScoreboard",
			condition = function ( menu, element, event )
				local f36_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
				if not f36_local0 then
					f36_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
					if not f36_local0 then
						f36_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
						if not f36_local0 then
							f36_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
						end
					end
				end
				return f36_local0
			end
		},
		{
			stateName = "SpeedBoost",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUse( menu, controller ) and IsHeroWeaponSpeedBurst( menu, controller )
			end
		},
		{
			stateName = "HideForCodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller ) and not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_qs_playerhud", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( model )
		f25_local1:updateElementState( self, {
			name = "model_validation",
			menu = f25_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), function ( model )
		f25_local1:updateElementState( self, {
			name = "model_validation",
			menu = f25_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		f25_local1:updateElementState( self, {
			name = "model_validation",
			menu = f25_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		f25_local1:updateElementState( self, {
			name = "model_validation",
			menu = f25_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		f25_local1:updateElementState( self, {
			name = "model_validation",
			menu = f25_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		f25_local1:updateElementState( self, {
			name = "model_validation",
			menu = f25_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.name" ), function ( model )
		f25_local1:updateElementState( self, {
			name = "model_validation",
			menu = f25_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.name"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		f25_local1:updateElementState( self, {
			name = "model_validation",
			menu = f25_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		f25_local1:updateElementState( self, {
			name = "model_validation",
			menu = f25_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	CoD.Menu.AddNavigationHandler( f25_local1, self, controller )
	SafeAreaContainer.id = "SafeAreaContainer"
	Top3PlayersScreenWidget:setModel( self.buttonModel, controller )
	Top3PlayersScreenWidget.id = "Top3PlayersScreenWidget"
	ScoreboardWidget:setModel( self.buttonModel, controller )
	ScoreboardWidget.id = "ScoreboardWidget"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f25_local1
	} )
	if not self:restoreState() then
		self.SafeAreaContainer:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SafeAreaContainer:close()
		element.ReadyEvents:close()
		element.MPScore:close()
		element.fullscreenContainer:close()
		element.MPDamageFeedback0:close()
		element.Outcome:close()
		element.Top3PlayersScreenWidget:close()
		element.ScoreboardWidget:close()
		element.IngameChatClientContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "T7Hud_MP.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

