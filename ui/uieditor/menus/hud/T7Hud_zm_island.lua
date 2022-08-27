-- 6b2da001fa81b52ee47838d21314c0fa
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
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsole" )
require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate" )
require( "ui.uieditor.widgets.MPHudWidgets.ScorePopup.MPScr" )
require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardWidgetCP" )
require( "ui.uieditor.widgets.Chat.inGame.IngameChatClientContainer" )
require( "ui.uieditor.widgets.ZMInventoryIsland.InventoryWidgetIsland" )
require( "ui.uieditor.widgets.ZMChallengesIsland.TrialWidget" )
require( "ui.uieditor.widgets.ZMInventoryIsland.GasMaskStatus" )
require( "ui.uieditor.widgets.ZMInventoryIsland.IslandSkullWidget" )
require( "ui.uieditor.widgets.ZMInventoryIsland.BucketAndSeedWidget" )
require( "ui.uieditor.widgets.ZMInventoryIsland.RocketShieldBlueprintWidget_Island" )
require( "ui.uieditor.widgets.ZMInventoryIsland.GasMaskBlueprintWidget_Island" )
require( "ui.uieditor.widgets.ZMInventoryIsland.MachineToolsBlueprintWidget_Island" )
require( "ui.uieditor.widgets.ZMInventoryIsland.WonderWeaponBlueprintWidget_Island" )

CoD.Zombie.CommonHudRequire()
local PreLoadFunc = function ( self, controller )
	CoD.Zombie.CommonPreLoadHud( self, controller )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	CoD.Zombie.CommonPostLoadHud( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "trialWidget.progress" )
	if f2_local0 then
		f2_arg0.TrialWidget:subscribeToModel( f2_local0, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				f2_arg0.TrialWidget.ProgressWidget.progressRing:setShaderVector( 0, modelValue, 0, 0, 0 )
			end
		end )
	end
	f2_arg0.TrialWidget:subscribeToGlobalModel( f2_arg1, "PerController", "scriptNotify", function ( model )
		if Engine.GetModelValue( model ) == "trial_set_description" then
			local f4_local0 = CoD.GetScriptNotifyData( model )
			f2_arg0.TrialWidget.ZmNotif1CursorHint.CursorHintText:setText( Engine.Localize( Engine.GetIString( f4_local0[1], "CS_LOCALIZED_STRINGS" ) ) )
		end
	end )
end

LUI.createMenu.T7Hud_zm_island = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_zm_island" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "T7Hud_zm_island.buttonPrompts" )
	local f5_local1 = self
	self.anyChildUsesUpdateState = true
	
	local ZMPerksContainerFactory = CoD.ZMPerksContainerFactory.new( f5_local1, controller )
	ZMPerksContainerFactory:setLeftRight( true, false, 130, 281 )
	ZMPerksContainerFactory:setTopBottom( false, true, -62, -26 )
	self:addElement( ZMPerksContainerFactory )
	self.ZMPerksContainerFactory = ZMPerksContainerFactory
	
	local Rounds = CoD.ZmRndContainer.new( f5_local1, controller )
	Rounds:setLeftRight( true, false, -32, 192 )
	Rounds:setTopBottom( false, true, -174, 18 )
	Rounds:setScale( 0.8 )
	self:addElement( Rounds )
	self.Rounds = Rounds
	
	local Ammo = CoD.ZmAmmoContainerFactory.new( f5_local1, controller )
	Ammo:setLeftRight( false, true, -427, 3 )
	Ammo:setTopBottom( false, true, -232, 0 )
	self:addElement( Ammo )
	self.Ammo = Ammo
	
	local Score = CoD.ZMScr.new( f5_local1, controller )
	Score:setLeftRight( true, false, 30, 164 )
	Score:setTopBottom( false, true, -256, -128 )
	Score:setYRot( 30 )
	Score:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				local f6_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f6_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
						f6_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
					else
						f6_local0 = false
					end
				end
				return f6_local0
			end
		}
	} )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	Score:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		f5_local1:updateElementState( Score, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( Score )
	self.Score = Score
	
	local fullscreenContainer = CoD.DynamicContainerWidget.new( f5_local1, controller )
	fullscreenContainer:setLeftRight( false, false, -640, 640 )
	fullscreenContainer:setTopBottom( false, false, -360, 360 )
	self:addElement( fullscreenContainer )
	self.fullscreenContainer = fullscreenContainer
	
	local Notifications = CoD.Notification.new( f5_local1, controller )
	Notifications:setLeftRight( true, true, 0, 0 )
	Notifications:setTopBottom( true, true, 0, 0 )
	self:addElement( Notifications )
	self.Notifications = Notifications
	
	local ZMPrematchCountdown0 = CoD.ZM_PrematchCountdown.new( f5_local1, controller )
	ZMPrematchCountdown0:setLeftRight( false, false, -640, 640 )
	ZMPrematchCountdown0:setTopBottom( false, false, -360, 360 )
	self:addElement( ZMPrematchCountdown0 )
	self.ZMPrematchCountdown0 = ZMPrematchCountdown0
	
	local ZmNotifBGBContainerFactory = CoD.ZmNotifBGB_ContainerFactory.new( f5_local1, controller )
	ZmNotifBGBContainerFactory:setLeftRight( false, false, -156, 156 )
	ZmNotifBGBContainerFactory:setTopBottom( true, false, -6, 247 )
	ZmNotifBGBContainerFactory:setScale( 0.75 )
	ZmNotifBGBContainerFactory:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f23_local0 = ZmNotifBGBContainerFactory
		if IsParamModelEqualToString( model, "zombie_bgb_token_notification" ) then
			AddZombieBGBTokenNotification( self, f23_local0, controller, model )
		elseif IsParamModelEqualToString( model, "zombie_bgb_notification" ) then
			AddZombieBGBNotification( self, f23_local0, model )
		elseif IsParamModelEqualToString( model, "zombie_notification" ) then
			AddZombieNotification( self, f23_local0, model )
		end
	end )
	self:addElement( ZmNotifBGBContainerFactory )
	self.ZmNotifBGBContainerFactory = ZmNotifBGBContainerFactory
	
	local CursorHint = CoD.ZMCursorHint.new( f5_local1, controller )
	CursorHint:setLeftRight( false, false, -243, 257 )
	CursorHint:setTopBottom( false, true, -134, -40 )
	CursorHint:mergeStateConditions( {
		{
			stateName = "Active_1x1",
			condition = function ( menu, element, event )
				local f24_local0 = IsCursorHintActive( controller )
				if f24_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 1 then
						f24_local0 = false
					else
						f24_local0 = true
					end
				end
				return f24_local0
			end
		},
		{
			stateName = "Active_2x1",
			condition = function ( menu, element, event )
				local f25_local0 = IsCursorHintActive( controller )
				if f25_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 2 then
						f25_local0 = false
					else
						f25_local0 = true
					end
				end
				return f25_local0
			end
		},
		{
			stateName = "Active_4x1",
			condition = function ( menu, element, event )
				local f26_local0 = IsCursorHintActive( controller )
				if f26_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 4 then
						f26_local0 = false
					else
						f26_local0 = true
					end
				end
				return f26_local0
			end
		},
		{
			stateName = "Active_NoImage",
			condition = function ( menu, element, event )
				local f27_local0 = IsCursorHintActive( controller )
				if f27_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
						f27_local0 = IsModelValueEqualTo( controller, "hudItems.cursorHintIconRatio", 0 )
					else
						f27_local0 = false
					end
				end
				return f27_local0
			end
		}
	} )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showCursorHint" ), function ( model )
		f5_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showCursorHint"
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		f5_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		f5_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		f5_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ), function ( model )
		f5_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		f5_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		f5_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		f5_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		f5_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cursorHintIconRatio" ), function ( model )
		f5_local1:updateElementState( CursorHint, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cursorHintIconRatio"
		} )
	end )
	self:addElement( CursorHint )
	self.CursorHint = CursorHint
	
	local ConsoleCenter = CoD.CenterConsole.new( f5_local1, controller )
	ConsoleCenter:setLeftRight( false, false, -370, 370 )
	ConsoleCenter:setTopBottom( true, false, 68.5, 166.5 )
	self:addElement( ConsoleCenter )
	self.ConsoleCenter = ConsoleCenter
	
	local DeadSpectate = CoD.DeadSpectate.new( f5_local1, controller )
	DeadSpectate:setLeftRight( false, false, -150, 150 )
	DeadSpectate:setTopBottom( false, true, -180, -120 )
	self:addElement( DeadSpectate )
	self.DeadSpectate = DeadSpectate
	
	local MPScore = CoD.MPScr.new( f5_local1, controller )
	MPScore:setLeftRight( false, false, -50, 50 )
	MPScore:setTopBottom( true, false, 233.5, 258.5 )
	MPScore:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f38_local0 = MPScore
		if IsParamModelEqualToString( model, "score_event" ) and PropertyIsTrue( self, "menuLoaded" ) then
			PlayClipOnElement( self, {
				elementName = "MPScore",
				clipName = "NormalScore"
			}, controller )
			SetMPScoreText( f5_local1, f38_local0, controller, model )
		end
	end )
	self:addElement( MPScore )
	self.MPScore = MPScore
	
	local ScoreboardWidget = CoD.ScoreboardWidgetCP.new( f5_local1, controller )
	ScoreboardWidget:setLeftRight( false, false, -503, 503 )
	ScoreboardWidget:setTopBottom( true, false, 247, 773 )
	self:addElement( ScoreboardWidget )
	self.ScoreboardWidget = ScoreboardWidget
	
	local IngameChatClientContainer = CoD.IngameChatClientContainer.new( f5_local1, controller )
	IngameChatClientContainer:setLeftRight( true, false, 0, 360 )
	IngameChatClientContainer:setTopBottom( true, false, -2.5, 717.5 )
	self:addElement( IngameChatClientContainer )
	self.IngameChatClientContainer = IngameChatClientContainer
	
	local IngameChatClientContainer0 = CoD.IngameChatClientContainer.new( f5_local1, controller )
	IngameChatClientContainer0:setLeftRight( true, false, 0, 360 )
	IngameChatClientContainer0:setTopBottom( true, false, -2.5, 717.5 )
	self:addElement( IngameChatClientContainer0 )
	self.IngameChatClientContainer0 = IngameChatClientContainer0
	
	local InventoryWidgetIsland = CoD.InventoryWidgetIsland.new( f5_local1, controller )
	InventoryWidgetIsland:setLeftRight( false, false, -640, 640 )
	InventoryWidgetIsland:setTopBottom( false, false, -360, 360 )
	self:addElement( InventoryWidgetIsland )
	self.InventoryWidgetIsland = InventoryWidgetIsland
	
	local TrialWidget = CoD.TrialWidget.new( f5_local1, controller )
	TrialWidget:setLeftRight( false, false, -59, 53 )
	TrialWidget:setTopBottom( false, true, -273, -161 )
	TrialWidget.ProgressWidget.progressRing:setShaderVector( 0, 0.5, 0, 0, 0 )
	TrialWidget:mergeStateConditions( {
		{
			stateName = "InProgress",
			condition = function ( menu, element, event )
				local f39_local0 = IsModelValueEqualTo( controller, "trialWidget.visible", 1 )
				if f39_local0 then
					f39_local0 = IsModelValueLessThan( controller, "trialWidget.progress", 1 )
					if f39_local0 then
						if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) then
							f39_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
						else
							f39_local0 = false
						end
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
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) then
						f40_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
					else
						f40_local0 = false
					end
				end
				return f40_local0
			end
		}
	} )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "trialWidget.visible" ), function ( model )
		f5_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "trialWidget.visible"
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "trialWidget.progress" ), function ( model )
		f5_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "trialWidget.progress"
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		f5_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		f5_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		f5_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ), function ( model )
		f5_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		f5_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		f5_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		f5_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT
		} )
	end )
	TrialWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		f5_local1:updateElementState( TrialWidget, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:addElement( TrialWidget )
	self.TrialWidget = TrialWidget
	
	local GasMaskStatus0 = CoD.GasMaskStatus.new( f5_local1, controller )
	GasMaskStatus0:setLeftRight( false, false, -120, 100 )
	GasMaskStatus0:setTopBottom( true, false, 464, 684 )
	GasMaskStatus0:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f51_local0 = IsCursorHintActive( controller )
				if f51_local0 then
					f51_local0 = IsModelValueEqualTo( controller, "trialWidget.visible", 1 )
					if f51_local0 then
						f51_local0 = AlwaysFalse()
					end
				end
				return f51_local0
			end
		}
	} )
	GasMaskStatus0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showCursorHint" ), function ( model )
		f5_local1:updateElementState( GasMaskStatus0, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showCursorHint"
		} )
	end )
	GasMaskStatus0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "trialWidget.visible" ), function ( model )
		f5_local1:updateElementState( GasMaskStatus0, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "trialWidget.visible"
		} )
	end )
	GasMaskStatus0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gaskmask_gasmask_active" ), function ( model )
		f5_local1:updateElementState( GasMaskStatus0, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gaskmask_gasmask_active"
		} )
	end )
	GasMaskStatus0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gaskmask_gasmask_progress" ), function ( model )
		f5_local1:updateElementState( GasMaskStatus0, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gaskmask_gasmask_progress"
		} )
	end )
	self:addElement( GasMaskStatus0 )
	self.GasMaskStatus0 = GasMaskStatus0
	
	local IslandSkullWidget0 = CoD.IslandSkullWidget.new( f5_local1, controller )
	IslandSkullWidget0:setLeftRight( true, false, 97, 261 )
	IslandSkullWidget0:setTopBottom( true, false, 12, 176 )
	IslandSkullWidget0:setScale( 0.6 )
	IslandSkullWidget0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ShowSkullPartsWidget( controller )
			end
		}
	} )
	IslandSkullWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_skull_parts" ), function ( model )
		f5_local1:updateElementState( IslandSkullWidget0, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_skull_parts"
		} )
	end )
	self:addElement( IslandSkullWidget0 )
	self.IslandSkullWidget0 = IslandSkullWidget0
	
	local BucketAndSeedWidget0 = CoD.BucketAndSeedWidget.new( f5_local1, controller )
	BucketAndSeedWidget0:setLeftRight( true, false, -32, 164 )
	BucketAndSeedWidget0:setTopBottom( true, false, -28, 204 )
	BucketAndSeedWidget0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ShowBucketOrSeedWidget( controller ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	BucketAndSeedWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_bucket_parts" ), function ( model )
		f5_local1:updateElementState( BucketAndSeedWidget0, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_bucket_parts"
		} )
	end )
	BucketAndSeedWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_seed_parts" ), function ( model )
		f5_local1:updateElementState( BucketAndSeedWidget0, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_seed_parts"
		} )
	end )
	BucketAndSeedWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f5_local1:updateElementState( BucketAndSeedWidget0, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( BucketAndSeedWidget0 )
	self.BucketAndSeedWidget0 = BucketAndSeedWidget0
	
	local RocketShield = CoD.RocketShieldBlueprintWidget_Island.new( f5_local1, controller )
	RocketShield:setLeftRight( true, false, -27, 287 )
	RocketShield:setTopBottom( true, false, 111.5, 240.5 )
	RocketShield:setScale( 0.8 )
	RocketShield:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and AlwaysFalse()
			end
		}
	} )
	RocketShield:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		f5_local1:updateElementState( RocketShield, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
		} )
	end )
	RocketShield:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f5_local1:updateElementState( RocketShield, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( RocketShield )
	self.RocketShield = RocketShield
	
	local GasMask = CoD.GasMaskBlueprintWidget_Island.new( f5_local1, controller )
	GasMask:setLeftRight( true, false, -17, 297 )
	GasMask:setTopBottom( true, false, 176, 305 )
	GasMask:setScale( 0.8 )
	GasMask:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and AlwaysFalse()
			end
		}
	} )
	GasMask:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_gasmask_parts" ), function ( model )
		f5_local1:updateElementState( GasMask, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_gasmask_parts"
		} )
	end )
	GasMask:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f5_local1:updateElementState( GasMask, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( GasMask )
	self.GasMask = GasMask
	
	local MachineTools = CoD.MachineToolsBlueprintWidget_Island.new( f5_local1, controller )
	MachineTools:setLeftRight( true, false, -11, 303 )
	MachineTools:setTopBottom( true, false, 305, 434 )
	MachineTools:setScale( 0.8 )
	MachineTools:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and AlwaysFalse()
			end
		}
	} )
	MachineTools:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_machinetools_parts" ), function ( model )
		f5_local1:updateElementState( MachineTools, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_machinetools_parts"
		} )
	end )
	MachineTools:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f5_local1:updateElementState( MachineTools, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( MachineTools )
	self.MachineTools = MachineTools
	
	local WonderWeapon = CoD.WonderWeaponBlueprintWidget_Island.new( f5_local1, controller )
	WonderWeapon:setLeftRight( true, false, -27, 287 )
	WonderWeapon:setTopBottom( true, false, 240.5, 369.5 )
	WonderWeapon:setScale( 0.8 )
	WonderWeapon:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and AlwaysFalse()
			end
		}
	} )
	WonderWeapon:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_wonderweapon_parts" ), function ( model )
		f5_local1:updateElementState( WonderWeapon, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_wonderweapon_parts"
		} )
	end )
	WonderWeapon:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f5_local1:updateElementState( WonderWeapon, {
			name = "model_validation",
			menu = f5_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( WonderWeapon )
	self.WonderWeapon = WonderWeapon
	
	Score.navigation = {
		up = ScoreboardWidget,
		right = ScoreboardWidget
	}
	ScoreboardWidget.navigation = {
		left = Score,
		down = Score
	}
	CoD.Menu.AddNavigationHandler( f5_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f74_local0 = nil
		SizeToSafeArea( element, controller )
		SetProperty( self, "menuLoaded", true )
		if not f74_local0 then
			f74_local0 = element:dispatchEventToChildren( event )
		end
		return f74_local0
	end )
	Score.id = "Score"
	ScoreboardWidget.id = "ScoreboardWidget"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f5_local1
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
		element.ZMPrematchCountdown0:close()
		element.ZmNotifBGBContainerFactory:close()
		element.CursorHint:close()
		element.ConsoleCenter:close()
		element.DeadSpectate:close()
		element.MPScore:close()
		element.ScoreboardWidget:close()
		element.IngameChatClientContainer:close()
		element.IngameChatClientContainer0:close()
		element.InventoryWidgetIsland:close()
		element.TrialWidget:close()
		element.GasMaskStatus0:close()
		element.IslandSkullWidget0:close()
		element.BucketAndSeedWidget0:close()
		element.RocketShield:close()
		element.GasMask:close()
		element.MachineTools:close()
		element.WonderWeapon:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "T7Hud_zm_island.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

