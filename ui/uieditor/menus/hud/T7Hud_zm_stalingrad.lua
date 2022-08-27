-- 61c464aa157699b411f0d1302a1ba171
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_Perks.ZMPerksContainerFactory" )
require( "ui.uieditor.widgets.HUD.ZM_RoundWidget.ZmRndContainer" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmoContainerFactory" )
require( "ui.uieditor.widgets.HUD.ZM_Score.ZMScr" )
require( "ui.uieditor.widgets.DynamicContainerWidget" )
require( "ui.uieditor.widgets.Notifications.Notification" )
require( "ui.uieditor.widgets.HUD.ZM_PrematchCountdown.ZM_PrematchCountdown" )
require( "ui.uieditor.widgets.HUD.ZM_NotifFactory.ZmNotifBGB_ContainerFactory" )
require( "ui.uieditor.widgets.HUD.ZM_CursorHint.ZMCursorHint" )
require( "ui.uieditor.widgets.ZMChallengesIsland.TrialWidget" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsole" )
require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate" )
require( "ui.uieditor.widgets.MPHudWidgets.ScorePopup.MPScr" )
require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardWidgetCP" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.TimerList_Stalingrad" )
require( "ui.uieditor.widgets.Chat.inGame.IngameChatClientContainer" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.InventoryWidgetStalingrad" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.PodControlWidget" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.DragonCollarControllerWidgets_stalingrad" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.DragonShieldWidgets_Stalingrad" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.DragonEggWidget" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.WearableBenefitsWidget" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.DragonStrikeWidgets_Stalingrad" )

CoD.Zombie.CommonHudRequire()
local PreLoadFunc = function ( self, controller )
	CoD.Zombie.CommonPreLoadHud( self, controller )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	CoD.Zombie.CommonPostLoadHud( f2_arg0, f2_arg1 )
	f2_arg0.TrialWidget:subscribeToGlobalModel( f2_arg1, "PerController", "scriptNotify", function ( model )
		if Engine.GetModelValue( model ) == "trial_set_description" then
			local f3_local0 = CoD.GetScriptNotifyData( model )
			f2_arg0.TrialWidget.ZmNotif1CursorHint.CursorHintText:setText( Engine.Localize( Engine.GetIString( f3_local0[1], "CS_LOCALIZED_STRINGS" ) ) )
		end
	end )
end

LUI.createMenu.T7Hud_zm_stalingrad = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_zm_stalingrad" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "T7Hud_zm_stalingrad.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local ZMPerksContainerFactory = CoD.ZMPerksContainerFactory.new( f4_local1, controller )
	ZMPerksContainerFactory:setLeftRight( true, false, 130, 281 )
	ZMPerksContainerFactory:setTopBottom( false, true, -62, -26 )
	self:addElement( ZMPerksContainerFactory )
	self.ZMPerksContainerFactory = ZMPerksContainerFactory
	
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
	
	local ZMPrematchCountdown = CoD.ZM_PrematchCountdown.new( f4_local1, controller )
	ZMPrematchCountdown:setLeftRight( false, false, -637, 643 )
	ZMPrematchCountdown:setTopBottom( false, false, -360, 360 )
	self:addElement( ZMPrematchCountdown )
	self.ZMPrematchCountdown = ZMPrematchCountdown
	
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
	
	local TrialWidget = CoD.TrialWidget.new( f4_local1, controller )
	TrialWidget:setLeftRight( false, false, -59, 53 )
	TrialWidget:setTopBottom( false, true, -273, -161 )
	TrialWidget:subscribeToGlobalModel( controller, "ZMStalingradChallenges", "icon", function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			TrialWidget.InProgressImage:setImage( RegisterImage( GetChallengeIcon( icon ) ) )
		end
	end )
	TrialWidget:subscribeToGlobalModel( controller, "ZMStalingradChallenges", "progress", function ( model )
		local progress = Engine.GetModelValue( model )
		if progress then
			TrialWidget.ProgressWidget.progressRing:setShaderVector( 0, CoD.GetVectorComponentFromString( progress, 1 ), CoD.GetVectorComponentFromString( progress, 2 ), CoD.GetVectorComponentFromString( progress, 3 ), CoD.GetVectorComponentFromString( progress, 4 ) )
		end
	end )
	TrialWidget:mergeStateConditions( {
		{
			stateName = "InProgress",
			condition = function ( menu, element, event )
				local f39_local0 = IsModelValueEqualTo( controller, "trialWidget.visible", 1 )
				if f39_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) then
						f39_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
					else
						f39_local0 = false
					end
				end
				return f39_local0
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				local f40_local0 = IsModelValueEqualTo( controller, "trialWidget.visible", 1 )
				if f40_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
						f40_local0 = AlwaysFalse()
					else
						f40_local0 = false
					end
				end
				return f40_local0
			end
		}
	} )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "trialWidget.visible" ), function ( model )
		f4_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "trialWidget.visible"
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		f4_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		f4_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		f4_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ), function ( model )
		f4_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		f4_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		f4_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		f4_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		f4_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:addElement( TrialWidget )
	self.TrialWidget = TrialWidget
	
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
		local f50_local0 = MPScore
		if IsParamModelEqualToString( model, "score_event" ) then
			PlayClipOnElement( self, {
				elementName = "MPScore",
				clipName = "NormalScore"
			}, controller )
			SetMPScoreText( f4_local1, f50_local0, controller, model )
		end
	end )
	self:addElement( MPScore )
	self.MPScore = MPScore
	
	local ScoreboardWidget = CoD.ScoreboardWidgetCP.new( f4_local1, controller )
	ScoreboardWidget:setLeftRight( false, false, -503, 503 )
	ScoreboardWidget:setTopBottom( true, false, 247, 773 )
	self:addElement( ScoreboardWidget )
	self.ScoreboardWidget = ScoreboardWidget
	
	local TimerListStalingrad = CoD.TimerList_Stalingrad.new( f4_local1, controller )
	TimerListStalingrad:setLeftRight( false, false, -187, 201 )
	TimerListStalingrad:setTopBottom( true, false, 161.5, 289.5 )
	self:addElement( TimerListStalingrad )
	self.TimerListStalingrad = TimerListStalingrad
	
	local f4_local17 = nil
	if IsPC() then
		f4_local17 = CoD.IngameChatClientContainer.new( f4_local1, controller )
	else
		f4_local17 = LUI.UIElement.createFake()
	end
	f4_local17:setLeftRight( true, false, 0, 360 )
	f4_local17:setTopBottom( true, false, -2.5, 717.5 )
	if IsPC() then
		self:addElement( f4_local17 )
	end
	self.IngameChatClientContainer = f4_local17
	
	local InventoryWidgetStalingrad = CoD.InventoryWidgetStalingrad.new( f4_local1, controller )
	InventoryWidgetStalingrad:setLeftRight( false, false, -640, 640 )
	InventoryWidgetStalingrad:setTopBottom( false, false, -360, 360 )
	self:addElement( InventoryWidgetStalingrad )
	self.InventoryWidgetStalingrad = InventoryWidgetStalingrad
	
	local PodControlWidget = CoD.PodControlWidget.new( f4_local1, controller )
	PodControlWidget:setLeftRight( true, false, -50.5, 146.34 )
	PodControlWidget:setTopBottom( true, false, -49, 184 )
	PodControlWidget:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	PodControlWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_cylinder" ), function ( model )
		f4_local1:updateElementState( PodControlWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_cylinder"
		} )
	end )
	self:addElement( PodControlWidget )
	self.PodControlWidget = PodControlWidget
	
	local DragonCollarControllerWidgets = CoD.DragonCollarControllerWidgets_stalingrad.new( f4_local1, controller )
	DragonCollarControllerWidgets:setLeftRight( true, false, -44, 403 )
	DragonCollarControllerWidgets:setTopBottom( true, false, 207.99, 336.99 )
	DragonCollarControllerWidgets:setScale( 0.8 )
	DragonCollarControllerWidgets:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	DragonCollarControllerWidgets:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_dragonride_parts" ), function ( model )
		f4_local1:updateElementState( DragonCollarControllerWidgets, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_dragonride_parts"
		} )
	end )
	self:addElement( DragonCollarControllerWidgets )
	self.DragonCollarControllerWidgets = DragonCollarControllerWidgets
	
	local DragonShieldWidgets = CoD.DragonShieldWidgets_Stalingrad.new( f4_local1, controller )
	DragonShieldWidgets:setLeftRight( true, false, -35, 350 )
	DragonShieldWidgets:setTopBottom( true, false, 102.5, 231.5 )
	DragonShieldWidgets:setScale( 0.8 )
	DragonShieldWidgets:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	DragonShieldWidgets:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		f4_local1:updateElementState( DragonShieldWidgets, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
		} )
	end )
	self:addElement( DragonShieldWidgets )
	self.DragonShieldWidgets = DragonShieldWidgets
	
	local DragonEggWidget = CoD.DragonEggWidget.new( f4_local1, controller )
	DragonEggWidget:setLeftRight( true, false, -35, 138.09 )
	DragonEggWidget:setTopBottom( true, false, 290.91, 464 )
	DragonEggWidget:setScale( 0.8 )
	DragonEggWidget:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and AlwaysFalse()
			end
		}
	} )
	DragonEggWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f4_local1:updateElementState( DragonEggWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	DragonEggWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_egg" ), function ( model )
		f4_local1:updateElementState( DragonEggWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_egg"
		} )
	end )
	DragonEggWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_egg" ), function ( model )
		f4_local1:updateElementState( DragonEggWidget, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_egg"
		} )
	end )
	self:addElement( DragonEggWidget )
	self.DragonEggWidget = DragonEggWidget
	
	local WearableBenefitsWidget = CoD.WearableBenefitsWidget.new( f4_local1, controller )
	WearableBenefitsWidget:setLeftRight( false, false, -327, 327 )
	WearableBenefitsWidget:setTopBottom( false, true, -222.5, -197.5 )
	self:addElement( WearableBenefitsWidget )
	self.WearableBenefitsWidget = WearableBenefitsWidget
	
	local DragonStrikeWidgetsStalingrad = CoD.DragonStrikeWidgets_Stalingrad.new( f4_local1, controller )
	DragonStrikeWidgetsStalingrad:setLeftRight( true, false, -50.5, 145.5 )
	DragonStrikeWidgetsStalingrad:setTopBottom( true, false, -49, 183 )
	DragonStrikeWidgetsStalingrad:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and AlwaysFalse()
			end
		}
	} )
	DragonStrikeWidgetsStalingrad:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_dragon_strike" ), function ( model )
		f4_local1:updateElementState( DragonStrikeWidgetsStalingrad, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_dragon_strike"
		} )
	end )
	DragonStrikeWidgetsStalingrad:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f4_local1:updateElementState( DragonStrikeWidgetsStalingrad, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( DragonStrikeWidgetsStalingrad )
	self.DragonStrikeWidgetsStalingrad = DragonStrikeWidgetsStalingrad
	
	Score.navigation = {
		up = ScoreboardWidget,
		right = ScoreboardWidget
	}
	ScoreboardWidget.navigation = {
		left = Score,
		down = Score
	}
	CoD.Menu.AddNavigationHandler( f4_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f64_local0 = nil
		SizeToSafeArea( element, controller )
		if not f64_local0 then
			f64_local0 = element:dispatchEventToChildren( event )
		end
		return f64_local0
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
		element.Rounds:close()
		element.Ammo:close()
		element.Score:close()
		element.fullscreenContainer:close()
		element.Notifications:close()
		element.ZMPrematchCountdown:close()
		element.ZmNotifBGBContainerFactory:close()
		element.CursorHint:close()
		element.TrialWidget:close()
		element.ConsoleCenter:close()
		element.DeadSpectate:close()
		element.MPScore:close()
		element.ScoreboardWidget:close()
		element.TimerListStalingrad:close()
		element.IngameChatClientContainer:close()
		element.InventoryWidgetStalingrad:close()
		element.PodControlWidget:close()
		element.DragonCollarControllerWidgets:close()
		element.DragonShieldWidgets:close()
		element.DragonEggWidget:close()
		element.WearableBenefitsWidget:close()
		element.DragonStrikeWidgetsStalingrad:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "T7Hud_zm_stalingrad.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

