require( "ui.uieditor.widgets.HUD.ZM_Perks.ZMPerksContainer" )
require( "ui.uieditor.widgets.HUD.ZM_RoundWidget.ZmRndContainer" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmoContainer" )
require( "ui.uieditor.widgets.HUD.ZM_Score.ZMScr" )
require( "ui.uieditor.widgets.DynamicContainerWidget" )
require( "ui.uieditor.widgets.Notifications.Notification" )
require( "ui.uieditor.widgets.HUD.ZM_NotifFactory.ZmNotifBGB_ContainerFactory" )
require( "ui.uieditor.widgets.HUD.ZM_CursorHint.ZMCursorHint" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsole" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_PlayerLivesIndicator" )
require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate" )
require( "ui.uieditor.widgets.MPHudWidgets.ScorePopup.MPScr" )
require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardWidgetCP" )
require( "ui.uieditor.widgets.HUD.ZM_PrematchCountdown.ZM_PrematchCountdown" )
require( "ui.uieditor.widgets.ZMInventory.InventoryWidget" )
require( "ui.uieditor.widgets.HUD.ZM_TimeBar.ZM_BeastmodeTimeBarWidget" )
require( "ui.uieditor.widgets.ZMInventory.FuseBox.FuseBoxWidget" )
require( "ui.uieditor.widgets.ZMInventory.RocketShieldBluePrint.RocketShieldBlueprintWidget" )
require( "ui.uieditor.widgets.ZMInventory.IDGunBlueprint.IDGunBlueprintWidget" )
require( "ui.uieditor.widgets.ZMInventory.Ritual.RitualWidget" )
require( "ui.uieditor.widgets.ZMInventory.SummoningKey.SummoningKeyWidget" )
require( "ui.uieditor.widgets.ZMInventory.Sprayer.SprayerWidget" )
require( "ui.uieditor.widgets.ZMInventory.QuestEgg.QuestEggWidget" )
require( "ui.uieditor.widgets.Chat.inGame.IngameChatClientContainer" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModelForController( controller )
	Engine.CreateModel( f1_local0, "bgb_current" )
	Engine.CreateModel( f1_local0, "bgb_display" )
	Engine.CreateModel( f1_local0, "bgb_timer" )
	Engine.CreateModel( f1_local0, "bgb_activations_remaining" )
	Engine.CreateModel( f1_local0, "bgb_invalid_use" )
	Engine.CreateModel( f1_local0, "bgb_one_shot_use" )
	Engine.CreateModel( f1_local0, "zmhud.swordEnergy" )
	Engine.CreateModel( f1_local0, "zmhud.swordState" )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "fastRestart" ), function ( model )
		CoD.Zombie.fastRestart = true
		CoD.Zombie.InitInventoryUIModels( controller )
		CoD.Zombie.fastRestart = nil
	end, false )
	CoD.Zombie.InitInventoryUIModels( controller )
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	local f3_local0 = DataSources.WorldSpaceIndicators.getModel( f3_arg1 )
	CoD.TacticalModeUtility.CreateShooterSpottedWidgets( f3_arg0, f3_arg1 )
	if f3_local0 then
		local f3_local1 = function ( f4_arg0 )
			local f4_local0 = f4_arg0:getFirstChild()
			while f4_local0 do
				if LUI.startswith( f4_local0.id, "bleedOutItem" ) then
					local f4_local1 = f4_local0:getModel( f3_arg1, "playerName" )
					if f4_local1 then
						Engine.SetModelValue( f4_local1, Engine.GetGamertagForClient( f3_arg1, f4_local0.bleedOutClient ) )
					end
				end
				f4_local0 = f4_local0:getNextSibling()
			end
		end
		
		local f3_local2 = 0
		local f3_local3 = true
		while f3_local3 do
			local f3_local4 = Engine.CreateModel( f3_local0, "bleedOutModel" .. f3_local2 )
			Engine.SetModelValue( Engine.CreateModel( f3_local4, "playerName" ), Engine.GetGamertagForClient( f3_arg1, f3_local2 ) )
			Engine.SetModelValue( Engine.CreateModel( f3_local4, "prompt" ), "ZMUI_REVIVE" )
			Engine.SetModelValue( Engine.CreateModel( f3_local4, "clockPercent" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f3_local4, "bleedOutPercent" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f3_local4, "stateFlags" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f3_local4, "arrowAngle" ), 0 )
			local f3_local5 = CoD.ZM_Revive.new( f3_arg0, f3_arg1 )
			f3_local5.bleedOutClient = f3_local2
			f3_local5.id = "bleedOutItem" .. f3_local2
			f3_local5:setLeftRight( true, false, 0, 0 )
			f3_local5:setTopBottom( true, false, 0, 0 )
			f3_local5:setModel( f3_local4 )
			f3_local3 = f3_local5:setupBleedOutWidget( f3_arg1, f3_local2 )
			f3_local5:processEvent( {
				name = "update_state",
				menu = f3_arg0
			} )
			f3_arg0.fullscreenContainer:addElement( f3_local5 )
			f3_arg0.fullscreenContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "playerConnected" ), function ( model )
				f3_local1( f3_arg0.fullscreenContainer )
			end )
			f3_local2 = f3_local2 + 1
		end
	end
	f3_arg0.m_inputDisabled = true
	if LUI.DEV ~= nil then
		if LUI.DEVHideButtonPrompts then
			f3_arg0.CursorHint:setAlpha( 0 )
		end
		f3_arg0:registerEventHandler( "hide_button_prompts", function ( element, event )
			element.CursorHint:setAlpha( event.show and 1 or 0 )
		end )
	end
end

LUI.createMenu.T7Hud_ZM = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_ZM" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "T7Hud_ZM.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local ZMPerksContainer = CoD.ZMPerksContainer.new( self, controller )
	ZMPerksContainer:setLeftRight( true, false, 130, 281 )
	ZMPerksContainer:setTopBottom( false, true, -62, -26 )
	self:addElement( ZMPerksContainer )
	self.ZMPerksContainer = ZMPerksContainer
	
	local Rounds = CoD.ZmRndContainer.new( self, controller )
	Rounds:setLeftRight( true, false, -32, 192 )
	Rounds:setTopBottom( false, true, -174, 18 )
	Rounds:setScale( 0.8 )
	Rounds:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				local f8_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f8_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) then
						f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
						if not f8_local0 then
							f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
							if not f8_local0 then
								f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
								if not f8_local0 then
									f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
									if not f8_local0 then
										f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
										if not f8_local0 then
											f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
											if not f8_local0 then
												f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
												if not f8_local0 then
													f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED )
													if not f8_local0 then
														f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
														if not f8_local0 then
															f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
															if not f8_local0 then
																f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
																if not f8_local0 then
																	f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
																	if not f8_local0 then
																		f8_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					else
						f8_local0 = true
					end
				end
				return f8_local0
			end
		}
	} )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	Rounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		self:updateElementState( Rounds, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( Rounds )
	self.Rounds = Rounds
	
	local Ammo = CoD.ZmAmmoContainer.new( self, controller )
	Ammo:setLeftRight( false, true, -424, 6 )
	Ammo:setTopBottom( false, true, -245.5, 3 )
	self:addElement( Ammo )
	self.Ammo = Ammo
	
	local Score = CoD.ZMScr.new( self, controller )
	Score:setLeftRight( true, false, 30, 164 )
	Score:setTopBottom( false, true, -253, -125 )
	Score:setYRot( 30 )
	Score:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				local f25_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f25_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
						f25_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
					else
						f25_local0 = false
					end
				end
				return f25_local0
			end
		}
	} )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		self:updateElementState( Score, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( Score )
	self.Score = Score
	
	local fullscreenContainer = CoD.DynamicContainerWidget.new( self, controller )
	fullscreenContainer:setLeftRight( false, false, -640, 640 )
	fullscreenContainer:setTopBottom( false, false, -360, 360 )
	self:addElement( fullscreenContainer )
	self.fullscreenContainer = fullscreenContainer
	
	local Notifications = CoD.Notification.new( self, controller )
	Notifications:setLeftRight( true, true, 0, 0 )
	Notifications:setTopBottom( true, true, 0, 0 )
	self:addElement( Notifications )
	self.Notifications = Notifications
	
	local ZmNotifBGBContainerFactory = CoD.ZmNotifBGB_ContainerFactory.new( self, controller )
	ZmNotifBGBContainerFactory:setLeftRight( false, false, -156, 156 )
	ZmNotifBGBContainerFactory:setTopBottom( true, false, -6, 247 )
	ZmNotifBGBContainerFactory:setScale( 0.75 )
	ZmNotifBGBContainerFactory:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f42_local0 = ZmNotifBGBContainerFactory
		if IsParamModelEqualToString( model, "zombie_bgb_token_notification" ) then
			AddZombieBGBTokenNotification( self, f42_local0, controller, model )
		elseif IsParamModelEqualToString( model, "zombie_bgb_notification" ) then
			AddZombieBGBNotification( self, f42_local0, model )
		elseif IsParamModelEqualToString( model, "zombie_notification" ) then
			AddZombieNotification( self, f42_local0, model )
		end
	end )
	self:addElement( ZmNotifBGBContainerFactory )
	self.ZmNotifBGBContainerFactory = ZmNotifBGBContainerFactory
	
	local CursorHint = CoD.ZMCursorHint.new( self, controller )
	CursorHint:setLeftRight( false, false, -250, 250 )
	CursorHint:setTopBottom( true, false, 522, 616 )
	CursorHint:mergeStateConditions( {
		{
			stateName = "Active_1x1",
			condition = function ( menu, element, event )
				local f43_local0 = IsCursorHintActive( controller )
				if f43_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 1 then
						f43_local0 = false
					else
						f43_local0 = true
					end
				end
				return f43_local0
			end
		},
		{
			stateName = "Active_2x1",
			condition = function ( menu, element, event )
				local f44_local0 = IsCursorHintActive( controller )
				if f44_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 2 then
						f44_local0 = false
					else
						f44_local0 = true
					end
				end
				return f44_local0
			end
		},
		{
			stateName = "Active_4x1",
			condition = function ( menu, element, event )
				local f45_local0 = IsCursorHintActive( controller )
				if f45_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 4 then
						f45_local0 = false
					else
						f45_local0 = true
					end
				end
				return f45_local0
			end
		},
		{
			stateName = "Active_NoImage",
			condition = function ( menu, element, event )
				local f46_local0 = IsCursorHintActive( controller )
				if f46_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
						f46_local0 = IsModelValueEqualTo( controller, "hudItems.cursorHintIconRatio", 0 )
					else
						f46_local0 = false
					end
				end
				return f46_local0
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
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
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
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
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
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT
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
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cursorHintIconRatio" ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cursorHintIconRatio"
		} )
	end )
	self:addElement( CursorHint )
	self.CursorHint = CursorHint
	
	local ConsoleCenter = CoD.CenterConsole.new( self, controller )
	ConsoleCenter:setLeftRight( false, false, -370, 370 )
	ConsoleCenter:setTopBottom( true, false, 68.5, 166.5 )
	self:addElement( ConsoleCenter )
	self.ConsoleCenter = ConsoleCenter
	
	local ZmAmmoPlayerLivesIndicator = CoD.ZmAmmo_PlayerLivesIndicator.new( self, controller )
	ZmAmmoPlayerLivesIndicator:setLeftRight( false, true, -192, -117 )
	ZmAmmoPlayerLivesIndicator:setTopBottom( false, true, -175, -125 )
	ZmAmmoPlayerLivesIndicator:setAlpha( 0 )
	ZmAmmoPlayerLivesIndicator:setYRot( -20 )
	self:addElement( ZmAmmoPlayerLivesIndicator )
	self.ZmAmmoPlayerLivesIndicator = ZmAmmoPlayerLivesIndicator
	
	local DeadSpectate = CoD.DeadSpectate.new( self, controller )
	DeadSpectate:setLeftRight( false, false, -150, 150 )
	DeadSpectate:setTopBottom( false, true, -180, -120 )
	self:addElement( DeadSpectate )
	self.DeadSpectate = DeadSpectate
	
	local MPScore = CoD.MPScr.new( self, controller )
	MPScore:setLeftRight( false, false, -50, 50 )
	MPScore:setTopBottom( true, false, 233.5, 258.5 )
	MPScore:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f57_local0 = MPScore
		if IsParamModelEqualToString( model, "score_event" ) and PropertyIsTrue( self, "menuLoaded" ) then
			PlayClipOnElement( self, {
				elementName = "MPScore",
				clipName = "NormalScore"
			}, controller )
			SetMPScoreText( self, f57_local0, controller, model )
		end
	end )
	self:addElement( MPScore )
	self.MPScore = MPScore
	
	local ScoreboardWidget = CoD.ScoreboardWidgetCP.new( self, controller )
	ScoreboardWidget:setLeftRight( false, false, -503, 503 )
	ScoreboardWidget:setTopBottom( true, false, 247, 773 )
	self:addElement( ScoreboardWidget )
	self.ScoreboardWidget = ScoreboardWidget
	
	local ZMPrematchCountdown0 = CoD.ZM_PrematchCountdown.new( self, controller )
	ZMPrematchCountdown0:setLeftRight( false, false, -640, 640 )
	ZMPrematchCountdown0:setTopBottom( false, false, -360, 360 )
	self:addElement( ZMPrematchCountdown0 )
	self.ZMPrematchCountdown0 = ZMPrematchCountdown0
	
	local InventoryWidget = CoD.InventoryWidget.new( self, controller )
	InventoryWidget:setLeftRight( false, false, -640, 640 )
	InventoryWidget:setTopBottom( false, false, -360, 360 )
	self:addElement( InventoryWidget )
	self.InventoryWidget = InventoryWidget
	
	local ZMBeastBar = CoD.ZM_BeastmodeTimeBarWidget.new( self, controller )
	ZMBeastBar:setLeftRight( false, false, -242.5, 321.5 )
	ZMBeastBar:setTopBottom( false, true, -174, -18 )
	ZMBeastBar:setScale( 0.7 )
	self:addElement( ZMBeastBar )
	self.ZMBeastBar = ZMBeastBar
	
	local FuseBoxWidget = CoD.FuseBoxWidget.new( self, controller )
	FuseBoxWidget:setLeftRight( true, false, -13.5, 126.5 )
	FuseBoxWidget:setTopBottom( true, false, 233, 362 )
	FuseBoxWidget:setScale( 0.6 )
	FuseBoxWidget:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and AlwaysFalse()
			end
		}
	} )
	FuseBoxWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_fuses" ), function ( model )
		self:updateElementState( FuseBoxWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_fuses"
		} )
	end )
	FuseBoxWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self:updateElementState( FuseBoxWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( FuseBoxWidget )
	self.FuseBoxWidget = FuseBoxWidget
	
	local RocketShieldBlueprintWidget = CoD.RocketShieldBlueprintWidget.new( self, controller )
	RocketShieldBlueprintWidget:setLeftRight( true, false, -12.5, 301.5 )
	RocketShieldBlueprintWidget:setTopBottom( true, false, 104, 233 )
	RocketShieldBlueprintWidget:setScale( 0.8 )
	RocketShieldBlueprintWidget:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and AlwaysFalse()
			end
		}
	} )
	RocketShieldBlueprintWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		self:updateElementState( RocketShieldBlueprintWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
		} )
	end )
	RocketShieldBlueprintWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self:updateElementState( RocketShieldBlueprintWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( RocketShieldBlueprintWidget )
	self.RocketShieldBlueprintWidget = RocketShieldBlueprintWidget
	
	local IDGunBlueprintWidget = CoD.IDGunBlueprintWidget.new( self, controller )
	IDGunBlueprintWidget:setLeftRight( true, false, -40, 274 )
	IDGunBlueprintWidget:setTopBottom( true, false, 168.5, 297.5 )
	IDGunBlueprintWidget:setScale( 0.8 )
	IDGunBlueprintWidget:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	IDGunBlueprintWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_idgun_parts" ), function ( model )
		self:updateElementState( IDGunBlueprintWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_idgun_parts"
		} )
	end )
	self:addElement( IDGunBlueprintWidget )
	self.IDGunBlueprintWidget = IDGunBlueprintWidget
	
	local RitualWidget = CoD.RitualWidget.new( self, controller )
	RitualWidget:setLeftRight( true, false, 124, 409 )
	RitualWidget:setTopBottom( true, false, 36, 155 )
	RitualWidget:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	RitualWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_quest_items" ), function ( model )
		self:updateElementState( RitualWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_quest_items"
		} )
	end )
	self:addElement( RitualWidget )
	self.RitualWidget = RitualWidget
	
	local SummoningKeyWidget = CoD.SummoningKeyWidget.new( self, controller )
	SummoningKeyWidget:setLeftRight( true, false, 15.5, 127.5 )
	SummoningKeyWidget:setTopBottom( true, false, 31, 160 )
	SummoningKeyWidget:setScale( 0.9 )
	self:addElement( SummoningKeyWidget )
	self.SummoningKeyWidget = SummoningKeyWidget
	
	local SprayerWidget = CoD.SprayerWidget.new( self, controller )
	SprayerWidget:setLeftRight( true, false, 14, 97 )
	SprayerWidget:setTopBottom( true, false, 321.5, 428.5 )
	SprayerWidget:setZoom( -1 )
	SprayerWidget:setScale( 0.9 )
	SprayerWidget:mergeStateConditions( {
		{
			stateName = "ScoreboardVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	SprayerWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_using_sprayer" ), function ( model )
		self:updateElementState( SprayerWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_using_sprayer"
		} )
	end )
	SprayerWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_sprayer" ), function ( model )
		self:updateElementState( SprayerWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_sprayer"
		} )
	end )
	SprayerWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.pod_sprayer_hint_range" ), function ( model )
		self:updateElementState( SprayerWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.pod_sprayer_hint_range"
		} )
	end )
	SprayerWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.pod_sprayer_held" ), function ( model )
		self:updateElementState( SprayerWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.pod_sprayer_held"
		} )
	end )
	self:addElement( SprayerWidget )
	self.SprayerWidget = SprayerWidget
	
	local QuestEggWidget = CoD.QuestEggWidget.new( self, controller )
	QuestEggWidget:setLeftRight( true, false, 80, 161 )
	QuestEggWidget:setTopBottom( true, false, 330.5, 407.5 )
	QuestEggWidget:setScale( 0.8 )
	QuestEggWidget:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	QuestEggWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_egg" ), function ( model )
		self:updateElementState( QuestEggWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_egg"
		} )
	end )
	self:addElement( QuestEggWidget )
	self.QuestEggWidget = QuestEggWidget
	
	local IngameChatClientContainer = CoD.IngameChatClientContainer.new( self, controller )
	IngameChatClientContainer:setLeftRight( true, false, 0, 360 )
	IngameChatClientContainer:setTopBottom( true, false, -2.5, 717.5 )
	self:addElement( IngameChatClientContainer )
	self.IngameChatClientContainer = IngameChatClientContainer
	
	local ZODUITEXTBOX = LUI.UIText.new()
	ZODUITEXTBOX:setLeftRight( true, false, 64, 484 )
	ZODUITEXTBOX:setTopBottom( true, false, 36, 61 )
	ZODUITEXTBOX:setText( Engine.Localize( "$(zmInventory.infoText)" ) )
	ZODUITEXTBOX:setTTF( "fonts/default.ttf" )
	ZODUITEXTBOX:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ZODUITEXTBOX:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ZODUITEXTBOX )
	self.ZODUITEXTBOX = ZODUITEXTBOX
	
	local ZmAmmoPlayerLivesIndicator0 = CoD.ZmAmmo_PlayerLivesIndicator.new( self, controller )
	ZmAmmoPlayerLivesIndicator0:setLeftRight( true, false, 196, 246 )
	ZmAmmoPlayerLivesIndicator0:setTopBottom( false, true, -146.25, -96.25 )
	ZmAmmoPlayerLivesIndicator0:setScale( 1.4 )
	self:addElement( ZmAmmoPlayerLivesIndicator0 )
	self.ZmAmmoPlayerLivesIndicator0 = ZmAmmoPlayerLivesIndicator0
	
	Score.navigation = {
		up = ScoreboardWidget,
		right = ScoreboardWidget
	}
	ScoreboardWidget.navigation = {
		left = Score,
		down = Score
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f75_local0 = nil
		SizeToSafeArea( self, controller )
		SetProperty( self, "menuLoaded", true )
		if not f75_local0 then
			f75_local0 = self:dispatchEventToChildren( event )
		end
		return f75_local0
	end )
	Score.id = "Score"
	ScoreboardWidget.id = "ScoreboardWidget"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ScoreboardWidget:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZMPerksContainer:close()
		element.Rounds:close()
		element.Ammo:close()
		element.Score:close()
		element.fullscreenContainer:close()
		element.Notifications:close()
		element.ZmNotifBGBContainerFactory:close()
		element.CursorHint:close()
		element.ConsoleCenter:close()
		element.ZmAmmoPlayerLivesIndicator:close()
		element.DeadSpectate:close()
		element.MPScore:close()
		element.ScoreboardWidget:close()
		element.ZMPrematchCountdown0:close()
		element.InventoryWidget:close()
		element.ZMBeastBar:close()
		element.FuseBoxWidget:close()
		element.RocketShieldBlueprintWidget:close()
		element.IDGunBlueprintWidget:close()
		element.RitualWidget:close()
		element.SummoningKeyWidget:close()
		element.SprayerWidget:close()
		element.QuestEggWidget:close()
		element.IngameChatClientContainer:close()
		element.ZmAmmoPlayerLivesIndicator0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "T7Hud_ZM.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

