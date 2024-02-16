-- d53d5a6e2abc31e880f9398f6e467b0c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_Perks.ZMPerksContainerFactory" )
require( "ui.uieditor.widgets.ZMInventoryGenesis.WearablePerksContainer_Genesis" )
require( "ui.uieditor.widgets.HUD.ZM_RoundWidget.ZmRndContainer" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmoContainerFactory" )
require( "ui.uieditor.widgets.HUD.ZM_Score.ZMScr" )
require( "ui.uieditor.widgets.DynamicContainerWidget" )
require( "ui.uieditor.widgets.Notifications.Notification" )
require( "ui.uieditor.widgets.HUD.ZM_PrematchCountdown.ZM_PrematchCountdown" )
require( "ui.uieditor.widgets.HUD.ZM_NotifFactory.ZmNotifBGB_ContainerFactory" )
require( "ui.uieditor.widgets.HUD.ZM_CursorHint.ZMCursorHint" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsole" )
require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate" )
require( "ui.uieditor.widgets.MPHudWidgets.ScorePopup.MPScr" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.WearableBenefitsWidget" )
require( "ui.uieditor.widgets.TrialWidget_Genesis" )
require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardWidgetCP" )
require( "ui.uieditor.widgets.Chat.inGame.IngameChatClientContainer" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.TimerList_Stalingrad" )
require( "ui.uieditor.widgets.InventoryWidgetGenesis" )
require( "ui.uieditor.widgets.ZMInventoryGenesis.ApothiconGatewormWidget_Genesis" )
require( "ui.uieditor.widgets.ZMInventoryGenesis.KeeperProtectorWidgets_Genesis" )
require( "ui.uieditor.widgets.ZMInventoryGenesis.RocketShieldWidget_Genesis" )

CoD.Zombie.CommonHudRequire()
local PreLoadFunc = function ( self, controller )
	CoD.Zombie.CommonPreLoadHud( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "GenesisEndGameEE" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	CoD.Zombie.CommonPostLoadHud( f2_arg0, f2_arg1 )
	f2_arg0.TrialWidgetGenesis0:subscribeToGlobalModel( f2_arg1, "PerController", "scriptNotify", function ( model )
		if Engine.GetModelValue( model ) == "trial_set_description" then
			local f3_local0 = CoD.GetScriptNotifyData( model )
			f2_arg0.TrialWidgetGenesis0.ZmNotif1CursorHint.CursorHintText:setText( Engine.Localize( Engine.GetIString( f3_local0[1], "CS_LOCALIZED_STRINGS" ) ) )
		end
	end )
end

LUI.createMenu.T7Hud_zm_genesis = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_zm_genesis" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "T7Hud_zm_genesis.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local ZMPerksContainerFactory = CoD.ZMPerksContainerFactory.new( f4_local1, controller )
	ZMPerksContainerFactory:setLeftRight( true, false, 130, 281 )
	ZMPerksContainerFactory:setTopBottom( false, true, -62, -26 )
	self:addElement( ZMPerksContainerFactory )
	self.ZMPerksContainerFactory = ZMPerksContainerFactory
	
	local WearablePerksContainerGenesis0 = CoD.WearablePerksContainer_Genesis.new( f4_local1, controller )
	WearablePerksContainerGenesis0:setLeftRight( true, false, 130, 204 )
	WearablePerksContainerGenesis0:setTopBottom( false, true, -102, -66 )
	self:addElement( WearablePerksContainerGenesis0 )
	self.WearablePerksContainerGenesis0 = WearablePerksContainerGenesis0
	
	local Rounds = CoD.ZmRndContainer.new( f4_local1, controller )
	Rounds:setLeftRight( true, false, -32, 192 )
	Rounds:setTopBottom( false, true, -174, 18 )
	Rounds:setScale( 0.8 )
	self:addElement( Rounds )
	self.Rounds = Rounds
	
	local Ammo = CoD.ZmAmmoContainerFactory.new( f4_local1, controller )
	Ammo:setLeftRight( false, true, -427, 3 )
	Ammo:setTopBottom( false, true, -232, 0 )
	self:addElement( Ammo )
	self.Ammo = Ammo
	
	local Score = CoD.ZMScr.new( f4_local1, controller )
	Score:setLeftRight( true, false, 30, 164 )
	Score:setTopBottom( false, true, -256, -128 )
	Score:setYRot( 30 )
	Score:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				local f5_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f5_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
						f5_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
					else
						f5_local0 = false
					end
				end
				return f5_local0
			end
		}
	} )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		f4_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( Score )
	self.Score = Score
	
	local fullscreenContainer = CoD.DynamicContainerWidget.new( f4_local1, controller )
	fullscreenContainer:setLeftRight( false, false, -640, 640 )
	fullscreenContainer:setTopBottom( false, false, -360, 360 )
	self:addElement( fullscreenContainer )
	self.fullscreenContainer = fullscreenContainer
	
	local Notifications = CoD.Notification.new( f4_local1, controller )
	Notifications:setLeftRight( true, true, 0, 0 )
	Notifications:setTopBottom( true, true, 0, 0 )
	self:addElement( Notifications )
	self.Notifications = Notifications
	
	local ZMPrematchCountdown0 = CoD.ZM_PrematchCountdown.new( f4_local1, controller )
	ZMPrematchCountdown0:setLeftRight( false, false, -640, 640 )
	ZMPrematchCountdown0:setTopBottom( false, false, -360, 360 )
	self:addElement( ZMPrematchCountdown0 )
	self.ZMPrematchCountdown0 = ZMPrematchCountdown0
	
	local ZmNotifBGBContainerFactory = CoD.ZmNotifBGB_ContainerFactory.new( f4_local1, controller )
	ZmNotifBGBContainerFactory:setLeftRight( false, false, -156, 156 )
	ZmNotifBGBContainerFactory:setTopBottom( true, false, -6, 247 )
	ZmNotifBGBContainerFactory:setScale( 0.75 )
	ZmNotifBGBContainerFactory:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f22_local0 = ZmNotifBGBContainerFactory
		if IsParamModelEqualToString( model, "zombie_bgb_token_notification" ) then
			AddZombieBGBTokenNotification( self, f22_local0, controller, model )
		elseif IsParamModelEqualToString( model, "zombie_bgb_notification" ) then
			AddZombieBGBNotification( self, f22_local0, model )
		elseif IsParamModelEqualToString( model, "zombie_notification" ) then
			AddZombieNotification( self, f22_local0, model )
		elseif IsParamModelEqualToString( model, "zombie_time_attack_notification" ) then
			AddZombieTimeAttackNotification( self, f22_local0, model )
		end
	end )
	self:addElement( ZmNotifBGBContainerFactory )
	self.ZmNotifBGBContainerFactory = ZmNotifBGBContainerFactory
	
	local CursorHint = CoD.ZMCursorHint.new( f4_local1, controller )
	CursorHint:setLeftRight( false, false, -243, 257 )
	CursorHint:setTopBottom( false, true, -134, -40 )
	CursorHint:mergeStateConditions( {
		{
			stateName = "Active_1x1",
			condition = function ( menu, element, event )
				local f23_local0 = IsCursorHintActive( controller )
				if f23_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 1 then
						f23_local0 = false
					else
						f23_local0 = true
					end
				end
				return f23_local0
			end
		},
		{
			stateName = "Active_2x1",
			condition = function ( menu, element, event )
				local f24_local0 = IsCursorHintActive( controller )
				if f24_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 2 then
						f24_local0 = false
					else
						f24_local0 = true
					end
				end
				return f24_local0
			end
		},
		{
			stateName = "Active_4x1",
			condition = function ( menu, element, event )
				local f25_local0 = IsCursorHintActive( controller )
				if f25_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 4 then
						f25_local0 = false
					else
						f25_local0 = true
					end
				end
				return f25_local0
			end
		},
		{
			stateName = "Active_NoImage",
			condition = function ( menu, element, event )
				local f26_local0 = IsCursorHintActive( controller )
				if f26_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
						f26_local0 = IsModelValueEqualTo( controller, "hudItems.cursorHintIconRatio", 0 )
					else
						f26_local0 = false
					end
				end
				return f26_local0
			end
		}
	} )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showCursorHint" ), function ( model )
		f4_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showCursorHint"
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		f4_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		f4_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		f4_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ), function ( model )
		f4_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		f4_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		f4_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		f4_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		f4_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cursorHintIconRatio" ), function ( model )
		f4_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cursorHintIconRatio"
		} )
	end )
	self:addElement( CursorHint )
	self.CursorHint = CursorHint
	
	local ConsoleCenter = CoD.CenterConsole.new( f4_local1, controller )
	ConsoleCenter:setLeftRight( false, false, -370, 370 )
	ConsoleCenter:setTopBottom( true, false, 68.5, 166.5 )
	self:addElement( ConsoleCenter )
	self.ConsoleCenter = ConsoleCenter
	
	local DeadSpectate = CoD.DeadSpectate.new( f4_local1, controller )
	DeadSpectate:setLeftRight( false, false, -150, 150 )
	DeadSpectate:setTopBottom( false, true, -180, -120 )
	self:addElement( DeadSpectate )
	self.DeadSpectate = DeadSpectate
	
	local MPScore = CoD.MPScr.new( f4_local1, controller )
	MPScore:setLeftRight( false, false, -50, 50 )
	MPScore:setTopBottom( true, false, 233.5, 258.5 )
	MPScore:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f37_local0 = MPScore
		if IsParamModelEqualToString( model, "score_event" ) and PropertyIsTrue( self, "menuLoaded" ) then
			PlayClipOnElement( self, {
				elementName = "MPScore",
				clipName = "NormalScore"
			}, controller )
			SetMPScoreText( f4_local1, f37_local0, controller, model )
		end
	end )
	self:addElement( MPScore )
	self.MPScore = MPScore
	
	local WearableBenefitsWidget = CoD.WearableBenefitsWidget.new( f4_local1, controller )
	WearableBenefitsWidget:setLeftRight( false, false, -327, 327 )
	WearableBenefitsWidget:setTopBottom( false, true, -241.5, -216.5 )
	WearableBenefitsWidget:subscribeToGlobalModel( controller, "ZMPlayerList", "0.zombieWearableIcon", function ( model )
		local 0ZombieWearableIcon = Engine.GetModelValue( model )
		if 0ZombieWearableIcon then
			WearableBenefitsWidget.wearableBenefits:setText( Engine.Localize( GetGenesisWearableDescription( 0ZombieWearableIcon ) ) )
		end
	end )
	self:addElement( WearableBenefitsWidget )
	self.WearableBenefitsWidget = WearableBenefitsWidget
	
	local TrialWidgetGenesis0 = CoD.TrialWidget_Genesis.new( f4_local1, controller )
	TrialWidgetGenesis0:setLeftRight( false, false, -59, 53 )
	TrialWidgetGenesis0:setTopBottom( false, true, -273, -141 )
	TrialWidgetGenesis0:subscribeToGlobalModel( controller, "ZMGenesisChallenges", "icon", function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			TrialWidgetGenesis0.InProgressImage:setImage( RegisterImage( GetChallengeIcon( icon ) ) )
		end
	end )
	TrialWidgetGenesis0:subscribeToGlobalModel( controller, "ZMGenesisChallenges", "progress", function ( model )
		local progress = Engine.GetModelValue( model )
		if progress then
			TrialWidgetGenesis0.ProgressWidget.progressRing:setShaderVector( 0, CoD.GetVectorComponentFromString( progress, 1 ), CoD.GetVectorComponentFromString( progress, 2 ), CoD.GetVectorComponentFromString( progress, 3 ), CoD.GetVectorComponentFromString( progress, 4 ) )
		end
	end )
	TrialWidgetGenesis0:mergeStateConditions( {
		{
			stateName = "InProgress",
			condition = function ( menu, element, event )
				local f41_local0 = IsModelValueEqualTo( controller, "trialWidget.visible", 1 )
				if f41_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) then
						f41_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
					else
						f41_local0 = false
					end
				end
				return f41_local0
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	TrialWidgetGenesis0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "trialWidget.visible" ), function ( model )
		f4_local1:updateElementState( TrialWidgetGenesis0, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "trialWidget.visible"
		} )
	end )
	TrialWidgetGenesis0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		f4_local1:updateElementState( TrialWidgetGenesis0, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	TrialWidgetGenesis0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		f4_local1:updateElementState( TrialWidgetGenesis0, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	TrialWidgetGenesis0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		f4_local1:updateElementState( TrialWidgetGenesis0, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	TrialWidgetGenesis0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ), function ( model )
		f4_local1:updateElementState( TrialWidgetGenesis0, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING
		} )
	end )
	TrialWidgetGenesis0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		f4_local1:updateElementState( TrialWidgetGenesis0, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	TrialWidgetGenesis0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		f4_local1:updateElementState( TrialWidgetGenesis0, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	TrialWidgetGenesis0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		f4_local1:updateElementState( TrialWidgetGenesis0, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT
		} )
	end )
	TrialWidgetGenesis0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		f4_local1:updateElementState( TrialWidgetGenesis0, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:addElement( TrialWidgetGenesis0 )
	self.TrialWidgetGenesis0 = TrialWidgetGenesis0
	
	local EndGameBlackScreen = LUI.UIImage.new()
	EndGameBlackScreen:setLeftRight( true, true, 0, 0 )
	EndGameBlackScreen:setTopBottom( true, true, 0, 0 )
	EndGameBlackScreen:setRGB( 0, 0, 0 )
	EndGameBlackScreen:setAlpha( 0 )
	self:addElement( EndGameBlackScreen )
	self.EndGameBlackScreen = EndGameBlackScreen
	
	local ScoreboardWidget = CoD.ScoreboardWidgetCP.new( f4_local1, controller )
	ScoreboardWidget:setLeftRight( false, false, -503, 503 )
	ScoreboardWidget:setTopBottom( true, false, 247, 773 )
	self:addElement( ScoreboardWidget )
	self.ScoreboardWidget = ScoreboardWidget
	
	local f4_local19 = nil
	if IsPC() then
		f4_local19 = CoD.IngameChatClientContainer.new( f4_local1, controller )
	else
		f4_local19 = LUI.UIElement.createFake()
	end
	f4_local19:setLeftRight( true, false, 0, 360 )
	f4_local19:setTopBottom( true, false, -2.5, 717.5 )
	if IsPC() then
		self:addElement( f4_local19 )
	end
	self.IngameChatClientContainer = f4_local19
	
	local TimerListStalingrad = CoD.TimerList_Stalingrad.new( f4_local1, controller )
	TimerListStalingrad:setLeftRight( false, false, -187, 201 )
	TimerListStalingrad:setTopBottom( true, false, 161.5, 289.5 )
	self:addElement( TimerListStalingrad )
	self.TimerListStalingrad = TimerListStalingrad
	
	local InventoryWidgetGenesis = CoD.InventoryWidgetGenesis.new( f4_local1, controller )
	InventoryWidgetGenesis:setLeftRight( false, false, -640, 640 )
	InventoryWidgetGenesis:setTopBottom( false, false, -360, 360 )
	self:addElement( InventoryWidgetGenesis )
	self.InventoryWidgetGenesis = InventoryWidgetGenesis
	
	local ApothiconGatewormWidget = CoD.ApothiconGatewormWidget_Genesis.new( f4_local1, controller )
	ApothiconGatewormWidget:setLeftRight( true, false, -36, 137 )
	ApothiconGatewormWidget:setTopBottom( true, false, 291, 464 )
	ApothiconGatewormWidget:setScale( 0.8 )
	ApothiconGatewormWidget:mergeStateConditions( {
		{
			stateName = "ScoreboardHidden",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not IsEitherInventoryItemVisible( controller, "widget_gate_worm", "widget_apothicon_egg" )
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return IsEitherInventoryItemVisible( controller, "widget_gate_worm", "widget_apothicon_egg" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT )
			end
		}
	} )
	ApothiconGatewormWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f4_local1:updateElementState( ApothiconGatewormWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	ApothiconGatewormWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_gate_worm" ), function ( model )
		f4_local1:updateElementState( ApothiconGatewormWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_gate_worm"
		} )
	end )
	ApothiconGatewormWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_apothicon_egg" ), function ( model )
		f4_local1:updateElementState( ApothiconGatewormWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_apothicon_egg"
		} )
	end )
	ApothiconGatewormWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		f4_local1:updateElementState( ApothiconGatewormWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT
		} )
	end )
	self:addElement( ApothiconGatewormWidget )
	self.ApothiconGatewormWidget = ApothiconGatewormWidget
	
	local KeeperProtectorWidgetsGenesis = CoD.KeeperProtectorWidgets_Genesis.new( f4_local1, controller )
	KeeperProtectorWidgetsGenesis:setLeftRight( true, false, -27.32, 286.68 )
	KeeperProtectorWidgetsGenesis:setTopBottom( true, false, 102.5, 231.5 )
	KeeperProtectorWidgetsGenesis:setScale( 0.8 )
	KeeperProtectorWidgetsGenesis:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	KeeperProtectorWidgetsGenesis:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_keeper_protector_parts" ), function ( model )
		f4_local1:updateElementState( KeeperProtectorWidgetsGenesis, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_keeper_protector_parts"
		} )
	end )
	self:addElement( KeeperProtectorWidgetsGenesis )
	self.KeeperProtectorWidgetsGenesis = KeeperProtectorWidgetsGenesis
	
	local RocketShieldWidgetGenesis = CoD.RocketShieldWidget_Genesis.new( f4_local1, controller )
	RocketShieldWidgetGenesis:setLeftRight( true, false, -27.32, 286.68 )
	RocketShieldWidgetGenesis:setTopBottom( true, false, 203.41, 332.41 )
	RocketShieldWidgetGenesis:setScale( 0.8 )
	RocketShieldWidgetGenesis:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	RocketShieldWidgetGenesis:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		f4_local1:updateElementState( RocketShieldWidgetGenesis, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
		} )
	end )
	self:addElement( RocketShieldWidgetGenesis )
	self.RocketShieldWidgetGenesis = RocketShieldWidgetGenesis
	
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
				self.EndGameBlackScreen:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( EndGameBlackScreen, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( f4_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f65_local0 = nil
		SizeToSafeArea( element, controller )
		SetProperty( self, "menuLoaded", true )
		if not f65_local0 then
			f65_local0 = element:dispatchEventToChildren( event )
		end
		return f65_local0
	end )
	self:subscribeToGlobalModel( controller, "PerController", "GenesisEndGameEE", function ( model )
		local f66_local0 = self
		if IsModelValueEqualTo( controller, "GenesisEndGameEE", 1 ) then
			PlayClip( self, "ShowEndGameBlackScreen", controller )
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
		menu = f4_local1
	} )
	if not self:restoreState() then
		self.ScoreboardWidget:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZMPerksContainerFactory:close()
		element.WearablePerksContainerGenesis0:close()
		element.Rounds:close()
		element.Ammo:close()
		element.Score:close()
		element.fullscreenContainer:close()
		element.Notifications:close()
		element.ZMPrematchCountdown0:close()
		element.ZmNotifBGBContainerFactory:close()
		element.CursorHint:close()
		element.ConsoleCenter:close()
		element.DeadSpectate:close()
		element.MPScore:close()
		element.WearableBenefitsWidget:close()
		element.TrialWidgetGenesis0:close()
		element.ScoreboardWidget:close()
		element.IngameChatClientContainer:close()
		element.TimerListStalingrad:close()
		element.InventoryWidgetGenesis:close()
		element.ApothiconGatewormWidget:close()
		element.KeeperProtectorWidgetsGenesis:close()
		element.RocketShieldWidgetGenesis:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "T7Hud_zm_genesis.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

