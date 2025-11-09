require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_HeroWeaponAnimation" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_HeroAbilityRouletteOverlay" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_HeroAbilityThiefOverlay" )

CoD.AmmoWidgetMPContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMPContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMPContainer )
	self.id = "AmmoWidgetMPContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 398 )
	self:setTopBottom( true, false, 0, 124 )
	self.anyChildUsesUpdateState = true
	
	local AmmoWidget = CoD.AmmoWidgetMP.new( menu, controller )
	AmmoWidget:setLeftRight( true, false, 0, 398 )
	AmmoWidget:setTopBottom( true, false, 0, 124 )
	AmmoWidget:setXRot( 15 )
	AmmoWidget:setYRot( -40 )
	AmmoWidget:mergeStateConditions( {
		{
			stateName = "HudStartGun",
			condition = function ( menu, element, event )
				local f2_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f2_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) then
						f2_local0 = IsGameTypeEqualToString( "gun" )
					else
						f2_local0 = false
					end
				end
				return f2_local0
			end
		},
		{
			stateName = "HudStartClassic",
			condition = function ( menu, element, event )
				local f3_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f3_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not IsSpectatingInvalidPlayer( controller ) then
						f3_local0 = ShouldUseClassicHud( controller )
					else
						f3_local0 = false
					end
				end
				return f3_local0
			end
		},
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				local f4_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f4_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) then
						f4_local0 = not IsSpectatingInvalidPlayer( controller )
					else
						f4_local0 = false
					end
				end
				return f4_local0
			end
		},
		{
			stateName = "HudPause",
			condition = function ( menu, element, event )
				local f5_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f5_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
						f5_local0 = not IsSpectatingInvalidPlayer( controller )
					else
						f5_local0 = false
					end
				end
				return f5_local0
			end
		}
	} )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	AmmoWidget:linkToElementModel( AmmoWidget, "clientNum", true, function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientNum"
		} )
	end )
	AmmoWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerIndex" ), function ( model )
		menu:updateElementState( AmmoWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerIndex"
		} )
	end )
	self:addElement( AmmoWidget )
	self.AmmoWidget = AmmoWidget
	
	local AmmoWidgetMPHeroWeaponAnimation0 = CoD.AmmoWidgetMP_HeroWeaponAnimation.new( menu, controller )
	AmmoWidgetMPHeroWeaponAnimation0:setLeftRight( true, false, 306, 404 )
	AmmoWidgetMPHeroWeaponAnimation0:setTopBottom( true, false, 43, 141 )
	AmmoWidgetMPHeroWeaponAnimation0:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				local f24_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f24_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not IsSpectatingInvalidPlayer( controller ) then
						f24_local0 = not HideSpecialistAbilityContainer( controller )
					else
						f24_local0 = false
					end
				end
				return f24_local0
			end
		},
		{
			stateName = "HudPause",
			condition = function ( menu, element, event )
				local f25_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f25_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not IsSpectatingInvalidPlayer( controller ) then
						f25_local0 = not HideSpecialistAbilityContainer( controller )
					else
						f25_local0 = false
					end
				end
				return f25_local0
			end
		}
	} )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:linkToElementModel( AmmoWidgetMPHeroWeaponAnimation0, "clientNum", true, function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientNum"
		} )
	end )
	AmmoWidgetMPHeroWeaponAnimation0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerIndex" ), function ( model )
		menu:updateElementState( AmmoWidgetMPHeroWeaponAnimation0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerIndex"
		} )
	end )
	self:addElement( AmmoWidgetMPHeroWeaponAnimation0 )
	self.AmmoWidgetMPHeroWeaponAnimation0 = AmmoWidgetMPHeroWeaponAnimation0
	
	local RouletteOverlay = CoD.AmmoWidget_HeroAbilityRouletteOverlay.new( menu, controller )
	RouletteOverlay:setLeftRight( true, false, 306, 404 )
	RouletteOverlay:setTopBottom( true, false, 43, 141 )
	RouletteOverlay:setZoom( 15 )
	RouletteOverlay:setScale( 1.2 )
	self:addElement( RouletteOverlay )
	self.RouletteOverlay = RouletteOverlay
	
	local AmmoWidgetHeroAbilityThiefOverlay = CoD.AmmoWidget_HeroAbilityThiefOverlay.new( menu, controller )
	AmmoWidgetHeroAbilityThiefOverlay:setLeftRight( true, false, 0, 398 )
	AmmoWidgetHeroAbilityThiefOverlay:setTopBottom( true, false, 0, 124 )
	AmmoWidgetHeroAbilityThiefOverlay:setXRot( 15 )
	AmmoWidgetHeroAbilityThiefOverlay:setYRot( -40 )
	self:addElement( AmmoWidgetHeroAbilityThiefOverlay )
	self.AmmoWidgetHeroAbilityThiefOverlay = AmmoWidgetHeroAbilityThiefOverlay
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				AmmoWidget:completeAnimation()
				self.AmmoWidget:setAlpha( 1 )
				self.clipFinished( AmmoWidget, {} )
				AmmoWidgetMPHeroWeaponAnimation0:completeAnimation()
				self.AmmoWidgetMPHeroWeaponAnimation0:setAlpha( 1 )
				self.clipFinished( AmmoWidgetMPHeroWeaponAnimation0, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local AmmoWidgetFrame2 = function ( AmmoWidget, event )
					if not event.interrupted then
						AmmoWidget:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					AmmoWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AmmoWidget, event )
					else
						AmmoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidget:completeAnimation()
				self.AmmoWidget:setAlpha( 1 )
				AmmoWidgetFrame2( AmmoWidget, {} )
				local AmmoWidgetMPHeroWeaponAnimation0Frame2 = function ( AmmoWidgetMPHeroWeaponAnimation0, event )
					if not event.interrupted then
						AmmoWidgetMPHeroWeaponAnimation0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					AmmoWidgetMPHeroWeaponAnimation0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetMPHeroWeaponAnimation0, event )
					else
						AmmoWidgetMPHeroWeaponAnimation0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetMPHeroWeaponAnimation0:completeAnimation()
				self.AmmoWidgetMPHeroWeaponAnimation0:setAlpha( 1 )
				AmmoWidgetMPHeroWeaponAnimation0Frame2( AmmoWidgetMPHeroWeaponAnimation0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local AmmoWidgetFrame2 = function ( AmmoWidget, event )
					if not event.interrupted then
						AmmoWidget:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					AmmoWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AmmoWidget, event )
					else
						AmmoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidget:completeAnimation()
				self.AmmoWidget:setAlpha( 0 )
				AmmoWidgetFrame2( AmmoWidget, {} )
				local AmmoWidgetMPHeroWeaponAnimation0Frame2 = function ( AmmoWidgetMPHeroWeaponAnimation0, event )
					if not event.interrupted then
						AmmoWidgetMPHeroWeaponAnimation0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					AmmoWidgetMPHeroWeaponAnimation0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetMPHeroWeaponAnimation0, event )
					else
						AmmoWidgetMPHeroWeaponAnimation0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetMPHeroWeaponAnimation0:completeAnimation()
				self.AmmoWidgetMPHeroWeaponAnimation0:setAlpha( 0 )
				AmmoWidgetMPHeroWeaponAnimation0Frame2( AmmoWidgetMPHeroWeaponAnimation0, {} )
			end
		},
		HideForCodcaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				AmmoWidget:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				self.AmmoWidget:setAlpha( 0 )
				AmmoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				AmmoWidgetMPHeroWeaponAnimation0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				self.AmmoWidgetMPHeroWeaponAnimation0:setAlpha( 0 )
				AmmoWidgetMPHeroWeaponAnimation0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				AmmoWidget:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				self.AmmoWidget:setAlpha( 0 )
				AmmoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				AmmoWidgetMPHeroWeaponAnimation0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				self.AmmoWidgetMPHeroWeaponAnimation0:setAlpha( 0 )
				AmmoWidgetMPHeroWeaponAnimation0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end
		},
		InvisibleStateCopyForCodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local AmmoWidgetFrame2 = function ( AmmoWidget, event )
					if not event.interrupted then
						AmmoWidget:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					AmmoWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AmmoWidget, event )
					else
						AmmoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidget:completeAnimation()
				self.AmmoWidget:setAlpha( 1 )
				AmmoWidgetFrame2( AmmoWidget, {} )
				local AmmoWidgetMPHeroWeaponAnimation0Frame2 = function ( AmmoWidgetMPHeroWeaponAnimation0, event )
					if not event.interrupted then
						AmmoWidgetMPHeroWeaponAnimation0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					AmmoWidgetMPHeroWeaponAnimation0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetMPHeroWeaponAnimation0, event )
					else
						AmmoWidgetMPHeroWeaponAnimation0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetMPHeroWeaponAnimation0:completeAnimation()
				self.AmmoWidgetMPHeroWeaponAnimation0:setAlpha( 1 )
				AmmoWidgetMPHeroWeaponAnimation0Frame2( AmmoWidgetMPHeroWeaponAnimation0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local AmmoWidgetFrame2 = function ( AmmoWidget, event )
					if not event.interrupted then
						AmmoWidget:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					AmmoWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AmmoWidget, event )
					else
						AmmoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidget:completeAnimation()
				self.AmmoWidget:setAlpha( 0 )
				AmmoWidgetFrame2( AmmoWidget, {} )
				local AmmoWidgetMPHeroWeaponAnimation0Frame2 = function ( AmmoWidgetMPHeroWeaponAnimation0, event )
					if not event.interrupted then
						AmmoWidgetMPHeroWeaponAnimation0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					AmmoWidgetMPHeroWeaponAnimation0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetMPHeroWeaponAnimation0, event )
					else
						AmmoWidgetMPHeroWeaponAnimation0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetMPHeroWeaponAnimation0:completeAnimation()
				self.AmmoWidgetMPHeroWeaponAnimation0:setAlpha( 0 )
				AmmoWidgetMPHeroWeaponAnimation0Frame2( AmmoWidgetMPHeroWeaponAnimation0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				local f59_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f59_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
						f59_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
						if f59_local0 then
						
						else
							return f59_local0
						end
					end
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
						f59_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
					else
						f59_local0 = false
					end
				end
				return f59_local0
			end
		},
		{
			stateName = "HideForCodcaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller ) and not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_inventory", 1 )
			end
		},
		{
			stateName = "InvisibleStateCopyForCodCaster",
			condition = function ( menu, element, event )
				local f61_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f61_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
						f61_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
						if f61_local0 then
						
						else
							return f61_local0
						end
					end
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
						f61_local0 = IsCodCaster( controller )
						if f61_local0 then
							f61_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_inventory", 1 )
						end
					else
						f61_local0 = false
					end
				end
				return f61_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AmmoWidget:close()
		element.AmmoWidgetMPHeroWeaponAnimation0:close()
		element.RouletteOverlay:close()
		element.AmmoWidgetHeroAbilityThiefOverlay:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

