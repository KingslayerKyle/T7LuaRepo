-- ed00b3262fd07759679d3144adf1faba
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.BombTimer.BombTimerWidget" )
require( "ui.uieditor.widgets.HUD.BombTimer.SDAliveCount" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "gameScore" )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "alliesAlive" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "enemiesAlive" ), 0 )
	Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( controller ), "SearchAndDestroy" ), "defending" )
end

CoD.SDOverlay = InheritFrom( LUI.UIElement )
CoD.SDOverlay.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SDOverlay )
	self.id = "SDOverlay"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local BombTimerWidgetA = CoD.BombTimerWidget.new( menu, controller )
	BombTimerWidgetA:setLeftRight( true, false, 160, 232 )
	BombTimerWidgetA:setTopBottom( true, false, 199, 223 )
	BombTimerWidgetA:setYRot( 21 )
	BombTimerWidgetA.BombTimerWidgetInternal.BombTimer:setupBombTimer( 0, true )
	BombTimerWidgetA.BombTimerWidgetInternal.AOrBText:setText( Engine.Localize( "A" ) )
	BombTimerWidgetA:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f3_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) then
					f3_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER_A )
				else
					f3_local0 = false
				end
				return f3_local0
			end
		},
		{
			stateName = "VisibleForCodCaster",
			condition = function ( menu, element, event )
				local f4_local0 = IsCodCaster( controller )
				if f4_local0 then
					f4_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_objective_status", 1 )
					if f4_local0 then
						if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) then
							f4_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER_A )
						else
							f4_local0 = false
						end
					end
				end
				return f4_local0
			end
		}
	} )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_A ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_A
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	BombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( BombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:addElement( BombTimerWidgetA )
	self.BombTimerWidgetA = BombTimerWidgetA
	
	local BombTimerWidgetB = CoD.BombTimerWidget.new( menu, controller )
	BombTimerWidgetB:setLeftRight( true, false, 160, 232 )
	BombTimerWidgetB:setTopBottom( true, false, 199, 223 )
	BombTimerWidgetB:setYRot( 21 )
	BombTimerWidgetB.BombTimerWidgetInternal.BombTimer:setupBombTimer( 1, true )
	BombTimerWidgetB.BombTimerWidgetInternal.AOrBText:setText( Engine.Localize( "B" ) )
	BombTimerWidgetB:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f24_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) then
					f24_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER_B )
				else
					f24_local0 = false
				end
				return f24_local0
			end
		},
		{
			stateName = "VisibleForCodCaster",
			condition = function ( menu, element, event )
				local f25_local0 = IsCodCaster( controller )
				if f25_local0 then
					f25_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_objective_status", 1 )
					if f25_local0 then
						if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) then
							f25_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER_B )
						else
							f25_local0 = false
						end
					end
				end
				return f25_local0
			end
		}
	} )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_B ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_B
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	BombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( BombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:addElement( BombTimerWidgetB )
	self.BombTimerWidgetB = BombTimerWidgetB
	
	local SDAliveCountFriendly = CoD.SDAliveCount.new( menu, controller )
	SDAliveCountFriendly:setLeftRight( true, false, 19.5, 143.5 )
	SDAliveCountFriendly:setTopBottom( true, false, 195.67, 219.67 )
	SDAliveCountFriendly:setYRot( 21 )
	SDAliveCountFriendly:subscribeToGlobalModel( controller, "HUDItems", "colorBlindSensitiveFriendlyColor", function ( model )
		local colorBlindSensitiveFriendlyColor = Engine.GetModelValue( model )
		if colorBlindSensitiveFriendlyColor then
			SDAliveCountFriendly.PlayerImage:setRGB( colorBlindSensitiveFriendlyColor )
		end
	end )
	SDAliveCountFriendly:subscribeToGlobalModel( controller, "GameScore", "alliesAlive", function ( model )
		local alliesAlive = Engine.GetModelValue( model )
		if alliesAlive then
			SDAliveCountFriendly.AliveCount:setText( Engine.Localize( alliesAlive ) )
		end
	end )
	self:addElement( SDAliveCountFriendly )
	self.SDAliveCountFriendly = SDAliveCountFriendly
	
	local SDAliveCountEnemy = CoD.SDAliveCount.new( menu, controller )
	SDAliveCountEnemy:setLeftRight( true, false, 19.5, 143.5 )
	SDAliveCountEnemy:setTopBottom( true, false, 221.67, 245.67 )
	SDAliveCountEnemy:setYRot( 21 )
	SDAliveCountEnemy:subscribeToGlobalModel( controller, "HUDItems", "colorBlindSensitiveEnemyColor", function ( model )
		local colorBlindSensitiveEnemyColor = Engine.GetModelValue( model )
		if colorBlindSensitiveEnemyColor then
			SDAliveCountEnemy.PlayerImage:setRGB( colorBlindSensitiveEnemyColor )
		end
	end )
	SDAliveCountEnemy:subscribeToGlobalModel( controller, "GameScore", "enemiesAlive", function ( model )
		local enemiesAlive = Engine.GetModelValue( model )
		if enemiesAlive then
			SDAliveCountEnemy.AliveCount:setText( Engine.Localize( enemiesAlive ) )
		end
	end )
	self:addElement( SDAliveCountEnemy )
	self.SDAliveCountEnemy = SDAliveCountEnemy
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BombTimerWidgetA:completeAnimation()
				self.BombTimerWidgetA:setLeftRight( true, false, 160, 232 )
				self.BombTimerWidgetA:setTopBottom( true, false, 200, 224 )
				self.BombTimerWidgetA:setAlpha( 1 )
				self.clipFinished( BombTimerWidgetA, {} )
				BombTimerWidgetB:completeAnimation()
				self.BombTimerWidgetB:setLeftRight( true, false, 160, 232 )
				self.BombTimerWidgetB:setTopBottom( true, false, 200, 224 )
				self.BombTimerWidgetB:setAlpha( 1 )
				self.clipFinished( BombTimerWidgetB, {} )
				SDAliveCountFriendly:completeAnimation()
				self.SDAliveCountFriendly:setLeftRight( true, false, 19.5, 143.5 )
				self.SDAliveCountFriendly:setTopBottom( true, false, 195.67, 219.67 )
				self.SDAliveCountFriendly:setAlpha( 1 )
				self.clipFinished( SDAliveCountFriendly, {} )
				SDAliveCountEnemy:completeAnimation()
				self.SDAliveCountEnemy:setLeftRight( true, false, 19.5, 143.5 )
				self.SDAliveCountEnemy:setTopBottom( true, false, 221.67, 245.67 )
				self.SDAliveCountEnemy:setAlpha( 1 )
				self.clipFinished( SDAliveCountEnemy, {} )
			end
		},
		HideForCodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BombTimerWidgetA:completeAnimation()
				self.BombTimerWidgetA:setLeftRight( true, false, 163.5, 235.5 )
				self.BombTimerWidgetA:setTopBottom( true, false, 201.67, 225.67 )
				self.BombTimerWidgetA:setAlpha( 0 )
				self.clipFinished( BombTimerWidgetA, {} )
				BombTimerWidgetB:completeAnimation()
				self.BombTimerWidgetB:setLeftRight( true, false, 160.5, 232.5 )
				self.BombTimerWidgetB:setTopBottom( true, false, 201.67, 225.67 )
				self.BombTimerWidgetB:setAlpha( 0 )
				self.clipFinished( BombTimerWidgetB, {} )
				SDAliveCountFriendly:completeAnimation()
				self.SDAliveCountFriendly:setAlpha( 0 )
				self.clipFinished( SDAliveCountFriendly, {} )
				SDAliveCountEnemy:completeAnimation()
				self.SDAliveCountEnemy:setAlpha( 0 )
				self.clipFinished( SDAliveCountEnemy, {} )
			end
		},
		DefaultStateHardcore = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BombTimerWidgetA:completeAnimation()
				self.BombTimerWidgetA:setLeftRight( true, false, 64, 136 )
				self.BombTimerWidgetA:setTopBottom( true, false, 197.67, 221.67 )
				self.BombTimerWidgetA:setAlpha( 1 )
				self.clipFinished( BombTimerWidgetA, {} )
				BombTimerWidgetB:completeAnimation()
				self.BombTimerWidgetB:setLeftRight( true, false, 61, 133 )
				self.BombTimerWidgetB:setTopBottom( true, false, 197.67, 221.67 )
				self.BombTimerWidgetB:setAlpha( 1 )
				self.clipFinished( BombTimerWidgetB, {} )
				SDAliveCountFriendly:completeAnimation()
				self.SDAliveCountFriendly:setAlpha( 1 )
				self.clipFinished( SDAliveCountFriendly, {} )
				SDAliveCountEnemy:completeAnimation()
				self.SDAliveCountEnemy:setAlpha( 1 )
				self.clipFinished( SDAliveCountEnemy, {} )
			end
		},
		CodCasterLargeMinimap = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BombTimerWidgetA:completeAnimation()
				self.BombTimerWidgetA:setLeftRight( true, false, 160, 232 )
				self.BombTimerWidgetA:setTopBottom( true, false, 248, 272 )
				self.BombTimerWidgetA:setAlpha( 1 )
				self.clipFinished( BombTimerWidgetA, {} )
				BombTimerWidgetB:completeAnimation()
				self.BombTimerWidgetB:setLeftRight( true, false, 160, 232 )
				self.BombTimerWidgetB:setTopBottom( true, false, 248, 272 )
				self.BombTimerWidgetB:setAlpha( 1 )
				self.clipFinished( BombTimerWidgetB, {} )
				SDAliveCountFriendly:completeAnimation()
				self.SDAliveCountFriendly:setLeftRight( true, false, 19.5, 143.5 )
				self.SDAliveCountFriendly:setTopBottom( true, false, 244.67, 268.67 )
				self.SDAliveCountFriendly:setAlpha( 1 )
				self.clipFinished( SDAliveCountFriendly, {} )
				SDAliveCountEnemy:completeAnimation()
				self.SDAliveCountEnemy:setLeftRight( true, false, 19.5, 143.5 )
				self.SDAliveCountEnemy:setTopBottom( true, false, 270.67, 294.67 )
				self.SDAliveCountEnemy:setAlpha( 1 )
				self.clipFinished( SDAliveCountEnemy, {} )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BombTimerWidgetA:completeAnimation()
				self.BombTimerWidgetA:setLeftRight( true, false, 160, 232 )
				self.BombTimerWidgetA:setTopBottom( true, false, 200, 224 )
				self.BombTimerWidgetA:setAlpha( 1 )
				self.clipFinished( BombTimerWidgetA, {} )
				BombTimerWidgetB:completeAnimation()
				self.BombTimerWidgetB:setLeftRight( true, false, 160, 232 )
				self.BombTimerWidgetB:setTopBottom( true, false, 200, 224 )
				self.BombTimerWidgetB:setAlpha( 1 )
				self.clipFinished( BombTimerWidgetB, {} )
				SDAliveCountFriendly:completeAnimation()
				self.SDAliveCountFriendly:setLeftRight( true, false, 19.5, 143.5 )
				self.SDAliveCountFriendly:setTopBottom( true, false, 195.67, 219.67 )
				self.SDAliveCountFriendly:setAlpha( 1 )
				self.clipFinished( SDAliveCountFriendly, {} )
				SDAliveCountEnemy:completeAnimation()
				self.SDAliveCountEnemy:setLeftRight( true, false, 19.5, 143.5 )
				self.SDAliveCountEnemy:setTopBottom( true, false, 221.67, 245.67 )
				self.SDAliveCountEnemy:setAlpha( 1 )
				self.clipFinished( SDAliveCountEnemy, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HideForCodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller ) and not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_qs_playerhud", 1 )
			end
		},
		{
			stateName = "DefaultStateHardcore",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
			end
		},
		{
			stateName = "CodCasterLargeMinimap",
			condition = function ( menu, element, event )
				return IsCodCaster( controller ) and IsCodCasterProfileValueEqualTo( controller, "shoutcaster_minimap", Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_FULL )
			end
		},
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller )
			end
		}
	} )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BombTimerWidgetA:close()
		element.BombTimerWidgetB:close()
		element.SDAliveCountFriendly:close()
		element.SDAliveCountEnemy:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

