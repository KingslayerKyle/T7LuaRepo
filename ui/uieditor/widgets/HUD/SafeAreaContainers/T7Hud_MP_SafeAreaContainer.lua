-- 1aa10828eec22d5cecdcbbe2265c8eb4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfoContainer" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMPContainer" )
require( "ui.uieditor.widgets.HUD.fx.EMP_ScoreInfo" )
require( "ui.uieditor.widgets.HUD.fx.EMP_WeaponInfo" )
require( "ui.uieditor.widgets.HUD.Map.CompassGroupMPContainer" )
require( "ui.uieditor.widgets.HUD.MP_VoipWidget.Voip_Container" )
require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_Container" )
require( "ui.uieditor.widgets.HUD.MPGametypes.MP_HardcoreInventoryWidget" )

CoD.T7Hud_MP_SafeAreaContainer = InheritFrom( LUI.UIElement )
CoD.T7Hud_MP_SafeAreaContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T7Hud_MP_SafeAreaContainer )
	self.id = "T7Hud_MP_SafeAreaContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ScoreInfo = CoD.ScoreInfoContainer.new( menu, controller )
	ScoreInfo:setLeftRight( true, false, -177, 437 )
	ScoreInfo:setTopBottom( false, true, -242, 8 )
	self:addElement( ScoreInfo )
	self.ScoreInfo = ScoreInfo
	
	local AmmoWidgetContainer = CoD.AmmoWidgetMPContainer.new( menu, controller )
	AmmoWidgetContainer:setLeftRight( false, true, -425, -27 )
	AmmoWidgetContainer:setTopBottom( false, true, -156, -32 )
	self:addElement( AmmoWidgetContainer )
	self.AmmoWidgetContainer = AmmoWidgetContainer
	
	local EMPScoreInfo = CoD.EMP_ScoreInfo.new( menu, controller )
	EMPScoreInfo:setLeftRight( true, false, -4, 337 )
	EMPScoreInfo:setTopBottom( false, true, -173, -2 )
	self:addElement( EMPScoreInfo )
	self.EMPScoreInfo = EMPScoreInfo
	
	local EMPWeaponInfo = CoD.EMP_WeaponInfo.new( menu, controller )
	EMPWeaponInfo:setLeftRight( false, true, -341, 0 )
	EMPWeaponInfo:setTopBottom( false, true, -171, 0 )
	self:addElement( EMPWeaponInfo )
	self.EMPWeaponInfo = EMPWeaponInfo
	
	local CompassGroupContainer = CoD.CompassGroupMPContainer.new( menu, controller )
	CompassGroupContainer:setLeftRight( true, false, 6, 289 )
	CompassGroupContainer:setTopBottom( true, false, -1.33, 202.67 )
	self:addElement( CompassGroupContainer )
	self.CompassGroupContainer = CompassGroupContainer
	
	local VoipContainer0 = CoD.Voip_Container.new( menu, controller )
	VoipContainer0:setLeftRight( true, false, 290, 563 )
	VoipContainer0:setTopBottom( true, false, 39, 111 )
	VoipContainer0:setYRot( 20 )
	VoipContainer0:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				local f2_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f2_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) then
						f2_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
					else
						f2_local0 = false
					end
				end
				return f2_local0
			end
		},
		{
			stateName = "ShowForCodCaster",
			condition = function ( menu, element, event )
				local f3_local0 = IsCodCaster( controller )
				if f3_local0 then
					f3_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_voipdock", 1 )
					if f3_local0 then
						f3_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
					end
				end
				return f3_local0
			end
		}
	} )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:addElement( VoipContainer0 )
	self.VoipContainer0 = VoipContainer0
	
	local ScrStkContainer = CoD.ScrStk_Container.new( menu, controller )
	ScrStkContainer:setLeftRight( false, true, -130.54, -22 )
	ScrStkContainer:setTopBottom( false, true, -303.41, -128 )
	ScrStkContainer:setXRot( 15 )
	ScrStkContainer:setYRot( -40 )
	ScrStkContainer:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				local f22_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f22_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ) and not IsGameTypeEqualToString( "gun" ) and not IsGameTypeEqualToString( "infect" ) and not IsGameTypeEqualToString( "prop" ) and not IsGameTypeEqualToString( "sniperonly" ) and not IsGameTypeEqualToString( "sas" ) then
						f22_local0 = not IsSpectatingInvalidPlayer( controller )
					else
						f22_local0 = false
					end
				end
				return f22_local0
			end
		},
		{
			stateName = "ShowForCodCaster",
			condition = function ( menu, element, event )
				local f23_local0 = IsCodCaster( controller )
				if f23_local0 then
					f23_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_scorestreaks", 1 )
					if f23_local0 then
						f23_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
						if f23_local0 then
							if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not IsGameTypeEqualToString( "gun" ) and not IsGameTypeEqualToString( "infect" ) and not IsGameTypeEqualToString( "prop" ) and not IsGameTypeEqualToString( "sniperonly" ) and not IsGameTypeEqualToString( "sas" ) then
								f23_local0 = not IsSpectatingInvalidPlayer( controller )
							else
								f23_local0 = false
							end
						end
					end
				end
				return f23_local0
			end
		}
	} )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION
		} )
	end )
	ScrStkContainer:linkToElementModel( ScrStkContainer, "clientNum", true, function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientNum"
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerIndex" ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerIndex"
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:addElement( ScrStkContainer )
	self.ScrStkContainer = ScrStkContainer
	
	local ScoreInfoFlash = LUI.UIImage.new()
	ScoreInfoFlash:setLeftRight( true, false, 25, 235.74 )
	ScoreInfoFlash:setTopBottom( false, true, -103, -41 )
	ScoreInfoFlash:setRGB( 0.75, 0.85, 1 )
	ScoreInfoFlash:setZRot( 8 )
	ScoreInfoFlash:setImage( RegisterImage( "uie_radial_gradient" ) )
	ScoreInfoFlash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ScoreInfoFlash )
	self.ScoreInfoFlash = ScoreInfoFlash
	
	local AmmoWidgetFlash = LUI.UIImage.new()
	AmmoWidgetFlash:setLeftRight( false, true, -239.05, -12 )
	AmmoWidgetFlash:setTopBottom( false, true, -93, -35 )
	AmmoWidgetFlash:setRGB( 0.75, 0.85, 1 )
	AmmoWidgetFlash:setZRot( -8 )
	AmmoWidgetFlash:setImage( RegisterImage( "uie_radial_gradient" ) )
	AmmoWidgetFlash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AmmoWidgetFlash )
	self.AmmoWidgetFlash = AmmoWidgetFlash
	
	local MPHardcoreInventoryWidget = CoD.MP_HardcoreInventoryWidget.new( menu, controller )
	MPHardcoreInventoryWidget:setLeftRight( false, true, -142, -64 )
	MPHardcoreInventoryWidget:setTopBottom( false, true, -132.33, -38.67 )
	self:addElement( MPHardcoreInventoryWidget )
	self.MPHardcoreInventoryWidget = MPHardcoreInventoryWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				ScoreInfo:completeAnimation()
				self.ScoreInfo:setLeftRight( true, false, -177, 437 )
				self.ScoreInfo:setTopBottom( false, true, -242, 8 )
				self.ScoreInfo:setRGB( 1, 1, 1 )
				self.ScoreInfo:setAlpha( 1 )
				self.clipFinished( ScoreInfo, {} )

				AmmoWidgetContainer:completeAnimation()
				self.AmmoWidgetContainer:setLeftRight( false, true, -425, -27 )
				self.AmmoWidgetContainer:setTopBottom( false, true, -156, -32 )
				self.AmmoWidgetContainer:setRGB( 1, 1, 1 )
				self.AmmoWidgetContainer:setAlpha( 1 )
				self.clipFinished( AmmoWidgetContainer, {} )

				CompassGroupContainer:completeAnimation()
				self.CompassGroupContainer:setAlpha( 1 )
				self.clipFinished( CompassGroupContainer, {} )

				VoipContainer0:completeAnimation()
				self.VoipContainer0:setAlpha( 1 )
				self.clipFinished( VoipContainer0, {} )

				ScrStkContainer:completeAnimation()
				self.ScrStkContainer:setAlpha( 1 )
				self.clipFinished( ScrStkContainer, {} )

				ScoreInfoFlash:completeAnimation()
				self.ScoreInfoFlash:setAlpha( 0 )
				self.clipFinished( ScoreInfoFlash, {} )

				AmmoWidgetFlash:completeAnimation()
				self.AmmoWidgetFlash:setAlpha( 0 )
				self.clipFinished( AmmoWidgetFlash, {} )
			end,
			SpeedBoost = function ()
				self:setupElementClipCounter( 4 )

				local ScoreInfoFrame2 = function ( ScoreInfo, event )
					local ScoreInfoFrame3 = function ( ScoreInfo, event )
						if not event.interrupted then
							ScoreInfo:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Linear )
						end
						ScoreInfo:setLeftRight( true, false, -188, 426 )
						ScoreInfo:setTopBottom( false, true, -232, 18 )
						ScoreInfo:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( ScoreInfo, event )
						else
							ScoreInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScoreInfoFrame3( ScoreInfo, event )
						return 
					else
						ScoreInfo:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
						ScoreInfo:setLeftRight( true, false, -182.5, 431.5 )
						ScoreInfo:setTopBottom( false, true, -237, 13 )
						ScoreInfo:setRGB( 0.2, 0.53, 1 )
						ScoreInfo:registerEventHandler( "transition_complete_keyframe", ScoreInfoFrame3 )
					end
				end
				
				ScoreInfo:completeAnimation()
				self.ScoreInfo:setLeftRight( true, false, -177, 437 )
				self.ScoreInfo:setTopBottom( false, true, -242, 8 )
				self.ScoreInfo:setRGB( 1, 1, 1 )
				ScoreInfoFrame2( ScoreInfo, {} )
				local AmmoWidgetContainerFrame2 = function ( AmmoWidgetContainer, event )
					local AmmoWidgetContainerFrame3 = function ( AmmoWidgetContainer, event )
						if not event.interrupted then
							AmmoWidgetContainer:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Linear )
						end
						AmmoWidgetContainer:setLeftRight( false, true, -404, -6 )
						AmmoWidgetContainer:setTopBottom( false, true, -144, -20 )
						AmmoWidgetContainer:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( AmmoWidgetContainer, event )
						else
							AmmoWidgetContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AmmoWidgetContainerFrame3( AmmoWidgetContainer, event )
						return 
					else
						AmmoWidgetContainer:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
						AmmoWidgetContainer:setLeftRight( false, true, -414.5, -16.5 )
						AmmoWidgetContainer:setTopBottom( false, true, -150, -26 )
						AmmoWidgetContainer:setRGB( 0.2, 0.53, 1 )
						AmmoWidgetContainer:registerEventHandler( "transition_complete_keyframe", AmmoWidgetContainerFrame3 )
					end
				end
				
				AmmoWidgetContainer:completeAnimation()
				self.AmmoWidgetContainer:setLeftRight( false, true, -425, -27 )
				self.AmmoWidgetContainer:setTopBottom( false, true, -156, -32 )
				self.AmmoWidgetContainer:setRGB( 1, 1, 1 )
				AmmoWidgetContainerFrame2( AmmoWidgetContainer, {} )
				local ScoreInfoFlashFrame2 = function ( ScoreInfoFlash, event )
					local ScoreInfoFlashFrame3 = function ( ScoreInfoFlash, event )
						local ScoreInfoFlashFrame4 = function ( ScoreInfoFlash, event )
							if not event.interrupted then
								ScoreInfoFlash:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							ScoreInfoFlash:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ScoreInfoFlash, event )
							else
								ScoreInfoFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ScoreInfoFlashFrame4( ScoreInfoFlash, event )
							return 
						else
							ScoreInfoFlash:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							ScoreInfoFlash:setAlpha( 0.75 )
							ScoreInfoFlash:registerEventHandler( "transition_complete_keyframe", ScoreInfoFlashFrame4 )
						end
					end
					
					if event.interrupted then
						ScoreInfoFlashFrame3( ScoreInfoFlash, event )
						return 
					else
						ScoreInfoFlash:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						ScoreInfoFlash:registerEventHandler( "transition_complete_keyframe", ScoreInfoFlashFrame3 )
					end
				end
				
				ScoreInfoFlash:completeAnimation()
				self.ScoreInfoFlash:setAlpha( 0 )
				ScoreInfoFlashFrame2( ScoreInfoFlash, {} )
				local AmmoWidgetFlashFrame2 = function ( AmmoWidgetFlash, event )
					local AmmoWidgetFlashFrame3 = function ( AmmoWidgetFlash, event )
						local AmmoWidgetFlashFrame4 = function ( AmmoWidgetFlash, event )
							if not event.interrupted then
								AmmoWidgetFlash:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							AmmoWidgetFlash:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( AmmoWidgetFlash, event )
							else
								AmmoWidgetFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AmmoWidgetFlashFrame4( AmmoWidgetFlash, event )
							return 
						else
							AmmoWidgetFlash:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							AmmoWidgetFlash:setAlpha( 0.75 )
							AmmoWidgetFlash:registerEventHandler( "transition_complete_keyframe", AmmoWidgetFlashFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetFlashFrame3( AmmoWidgetFlash, event )
						return 
					else
						AmmoWidgetFlash:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						AmmoWidgetFlash:registerEventHandler( "transition_complete_keyframe", AmmoWidgetFlashFrame3 )
					end
				end
				
				AmmoWidgetFlash:completeAnimation()
				self.AmmoWidgetFlash:setAlpha( 0 )
				AmmoWidgetFlashFrame2( AmmoWidgetFlash, {} )
			end
		},
		HideAllButScoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				ScoreInfo:completeAnimation()
				self.ScoreInfo:setAlpha( 0 )
				self.clipFinished( ScoreInfo, {} )

				AmmoWidgetContainer:completeAnimation()
				self.AmmoWidgetContainer:setAlpha( 0 )
				self.clipFinished( AmmoWidgetContainer, {} )

				EMPScoreInfo:completeAnimation()
				self.EMPScoreInfo:setAlpha( 0 )
				self.clipFinished( EMPScoreInfo, {} )

				EMPWeaponInfo:completeAnimation()
				self.EMPWeaponInfo:setAlpha( 0 )
				self.clipFinished( EMPWeaponInfo, {} )

				CompassGroupContainer:completeAnimation()
				self.CompassGroupContainer:setAlpha( 0 )
				self.clipFinished( CompassGroupContainer, {} )

				VoipContainer0:completeAnimation()
				self.VoipContainer0:setAlpha( 0 )
				self.clipFinished( VoipContainer0, {} )

				ScrStkContainer:completeAnimation()
				self.ScrStkContainer:setAlpha( 0 )
				self.clipFinished( ScrStkContainer, {} )

				ScoreInfoFlash:completeAnimation()
				self.ScoreInfoFlash:setAlpha( 0 )
				self.clipFinished( ScoreInfoFlash, {} )

				AmmoWidgetFlash:completeAnimation()
				self.AmmoWidgetFlash:setAlpha( 0 )
				self.clipFinished( AmmoWidgetFlash, {} )
			end
		},
		SpeedBoost = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )

				local ScoreInfoFrame2 = function ( ScoreInfo, event )
					local ScoreInfoFrame3 = function ( ScoreInfo, event )
						if not event.interrupted then
							ScoreInfo:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Linear )
						end
						ScoreInfo:setLeftRight( true, false, -177, 437 )
						ScoreInfo:setTopBottom( false, true, -242, 8 )
						ScoreInfo:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( ScoreInfo, event )
						else
							ScoreInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScoreInfoFrame3( ScoreInfo, event )
						return 
					else
						ScoreInfo:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
						ScoreInfo:setLeftRight( true, false, -182.5, 431.5 )
						ScoreInfo:setTopBottom( false, true, -237, 13 )
						ScoreInfo:setRGB( 0.2, 0.53, 1 )
						ScoreInfo:registerEventHandler( "transition_complete_keyframe", ScoreInfoFrame3 )
					end
				end
				
				ScoreInfo:completeAnimation()
				self.ScoreInfo:setLeftRight( true, false, -188, 426 )
				self.ScoreInfo:setTopBottom( false, true, -232, 18 )
				self.ScoreInfo:setRGB( 1, 1, 1 )
				ScoreInfoFrame2( ScoreInfo, {} )
				local AmmoWidgetContainerFrame2 = function ( AmmoWidgetContainer, event )
					local AmmoWidgetContainerFrame3 = function ( AmmoWidgetContainer, event )
						if not event.interrupted then
							AmmoWidgetContainer:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Linear )
						end
						AmmoWidgetContainer:setLeftRight( false, true, -425, -27 )
						AmmoWidgetContainer:setTopBottom( false, true, -156, -32 )
						AmmoWidgetContainer:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( AmmoWidgetContainer, event )
						else
							AmmoWidgetContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AmmoWidgetContainerFrame3( AmmoWidgetContainer, event )
						return 
					else
						AmmoWidgetContainer:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
						AmmoWidgetContainer:setLeftRight( false, true, -414.5, -16.5 )
						AmmoWidgetContainer:setTopBottom( false, true, -150, -26 )
						AmmoWidgetContainer:setRGB( 0.2, 0.53, 1 )
						AmmoWidgetContainer:registerEventHandler( "transition_complete_keyframe", AmmoWidgetContainerFrame3 )
					end
				end
				
				AmmoWidgetContainer:completeAnimation()
				self.AmmoWidgetContainer:setLeftRight( false, true, -404, -6 )
				self.AmmoWidgetContainer:setTopBottom( false, true, -144, -20 )
				self.AmmoWidgetContainer:setRGB( 1, 1, 1 )
				AmmoWidgetContainerFrame2( AmmoWidgetContainer, {} )
				local ScoreInfoFlashFrame2 = function ( ScoreInfoFlash, event )
					local ScoreInfoFlashFrame3 = function ( ScoreInfoFlash, event )
						local ScoreInfoFlashFrame4 = function ( ScoreInfoFlash, event )
							if not event.interrupted then
								ScoreInfoFlash:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							ScoreInfoFlash:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ScoreInfoFlash, event )
							else
								ScoreInfoFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ScoreInfoFlashFrame4( ScoreInfoFlash, event )
							return 
						else
							ScoreInfoFlash:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							ScoreInfoFlash:setAlpha( 0.75 )
							ScoreInfoFlash:registerEventHandler( "transition_complete_keyframe", ScoreInfoFlashFrame4 )
						end
					end
					
					if event.interrupted then
						ScoreInfoFlashFrame3( ScoreInfoFlash, event )
						return 
					else
						ScoreInfoFlash:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						ScoreInfoFlash:registerEventHandler( "transition_complete_keyframe", ScoreInfoFlashFrame3 )
					end
				end
				
				ScoreInfoFlash:completeAnimation()
				self.ScoreInfoFlash:setAlpha( 0 )
				ScoreInfoFlashFrame2( ScoreInfoFlash, {} )
				local AmmoWidgetFlashFrame2 = function ( AmmoWidgetFlash, event )
					local AmmoWidgetFlashFrame3 = function ( AmmoWidgetFlash, event )
						local AmmoWidgetFlashFrame4 = function ( AmmoWidgetFlash, event )
							if not event.interrupted then
								AmmoWidgetFlash:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							AmmoWidgetFlash:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( AmmoWidgetFlash, event )
							else
								AmmoWidgetFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AmmoWidgetFlashFrame4( AmmoWidgetFlash, event )
							return 
						else
							AmmoWidgetFlash:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							AmmoWidgetFlash:setAlpha( 0.75 )
							AmmoWidgetFlash:registerEventHandler( "transition_complete_keyframe", AmmoWidgetFlashFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetFlashFrame3( AmmoWidgetFlash, event )
						return 
					else
						AmmoWidgetFlash:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						AmmoWidgetFlash:registerEventHandler( "transition_complete_keyframe", AmmoWidgetFlashFrame3 )
					end
				end
				
				AmmoWidgetFlash:completeAnimation()
				self.AmmoWidgetFlash:setAlpha( 0 )
				AmmoWidgetFlashFrame2( AmmoWidgetFlash, {} )
			end
		},
		HideForCodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				ScoreInfo:completeAnimation()
				self.ScoreInfo:setAlpha( 0 )
				self.clipFinished( ScoreInfo, {} )

				AmmoWidgetContainer:completeAnimation()
				self.AmmoWidgetContainer:setAlpha( 0 )
				self.clipFinished( AmmoWidgetContainer, {} )

				EMPScoreInfo:completeAnimation()
				self.EMPScoreInfo:setAlpha( 0 )
				self.clipFinished( EMPScoreInfo, {} )

				EMPWeaponInfo:completeAnimation()
				self.EMPWeaponInfo:setAlpha( 0 )
				self.clipFinished( EMPWeaponInfo, {} )

				CompassGroupContainer:completeAnimation()
				self.CompassGroupContainer:setAlpha( 0 )
				self.clipFinished( CompassGroupContainer, {} )

				VoipContainer0:completeAnimation()
				self.VoipContainer0:setAlpha( 0 )
				self.clipFinished( VoipContainer0, {} )

				ScrStkContainer:completeAnimation()
				self.ScrStkContainer:setAlpha( 0 )
				self.clipFinished( ScrStkContainer, {} )

				ScoreInfoFlash:completeAnimation()
				self.ScoreInfoFlash:setAlpha( 0 )
				self.clipFinished( ScoreInfoFlash, {} )

				AmmoWidgetFlash:completeAnimation()
				self.AmmoWidgetFlash:setAlpha( 0 )
				self.clipFinished( AmmoWidgetFlash, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "HideAllButScoreboard",
			condition = function ( menu, element, event )
				local f72_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
				if not f72_local0 then
					f72_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
					if not f72_local0 then
						f72_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
						if not f72_local0 then
							f72_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
						end
					end
				end
				return f72_local0
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
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.name" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.name"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	ScrStkContainer.id = "ScrStkContainer"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ScrStkContainer:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreInfo:close()
		element.AmmoWidgetContainer:close()
		element.EMPScoreInfo:close()
		element.EMPWeaponInfo:close()
		element.CompassGroupContainer:close()
		element.VoipContainer0:close()
		element.ScrStkContainer:close()
		element.MPHardcoreInventoryWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
