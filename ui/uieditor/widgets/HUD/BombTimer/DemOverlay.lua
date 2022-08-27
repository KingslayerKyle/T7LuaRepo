-- ac334dd8a91437d98cd80af0154d8308
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.BombTimer.DemBombTimerWidget" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "Demolition" )
	Engine.CreateModel( f1_local0, "defending" )
	Engine.CreateModel( f1_local0, "dem_a_visible" )
	Engine.CreateModel( f1_local0, "dem_b_visible" )
end

CoD.DemOverlay = InheritFrom( LUI.UIElement )
CoD.DemOverlay.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DemOverlay )
	self.id = "DemOverlay"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local DemBombTimerWidgetB = CoD.DemBombTimerWidget.new( menu, controller )
	DemBombTimerWidgetB:setLeftRight( true, false, 16, 89 )
	DemBombTimerWidgetB:setTopBottom( true, false, 222, 246 )
	DemBombTimerWidgetB:setYRot( 21 )
	DemBombTimerWidgetB.BombTimer:setupBombTimer( 1, true )
	DemBombTimerWidgetB.AOrBText:setText( Engine.Localize( "B" ) )
	DemBombTimerWidgetB:mergeStateConditions( {
		{
			stateName = "HiddenNoBombSite",
			condition = function ( menu, element, event )
				return not IsModelValueTrue( controller, "Demolition.dem_b_visible" )
			end
		},
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER_B )
			end
		}
	} )
	DemBombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( DemBombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	DemBombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( DemBombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	DemBombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( DemBombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	DemBombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( DemBombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	DemBombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( DemBombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	DemBombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( DemBombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	DemBombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( DemBombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	DemBombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( DemBombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	DemBombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( DemBombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
		} )
	end )
	DemBombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( DemBombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	DemBombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( DemBombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	DemBombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Demolition.dem_b_visible" ), function ( model )
		menu:updateElementState( DemBombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Demolition.dem_b_visible"
		} )
	end )
	DemBombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_B ), function ( model )
		menu:updateElementState( DemBombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_B
		} )
	end )
	DemBombTimerWidgetB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Demolition.defending" ), function ( model )
		menu:updateElementState( DemBombTimerWidgetB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Demolition.defending"
		} )
	end )
	self:addElement( DemBombTimerWidgetB )
	self.DemBombTimerWidgetB = DemBombTimerWidgetB
	
	local DemBombTimerWidgetA = CoD.DemBombTimerWidget.new( menu, controller )
	DemBombTimerWidgetA:setLeftRight( true, false, 16, 89 )
	DemBombTimerWidgetA:setTopBottom( true, false, 196, 220 )
	DemBombTimerWidgetA:setYRot( 21 )
	DemBombTimerWidgetA.BombTimer:setupBombTimer( 0, true )
	DemBombTimerWidgetA.AOrBText:setText( Engine.Localize( "A" ) )
	DemBombTimerWidgetA:mergeStateConditions( {
		{
			stateName = "HiddenNoBombSite",
			condition = function ( menu, element, event )
				return not IsModelValueTrue( controller, "Demolition.dem_a_visible" )
			end
		},
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER_A )
			end
		}
	} )
	DemBombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( DemBombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	DemBombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( DemBombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	DemBombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( DemBombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	DemBombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( DemBombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	DemBombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( DemBombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	DemBombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( DemBombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	DemBombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( DemBombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	DemBombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( DemBombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	DemBombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( DemBombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
		} )
	end )
	DemBombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( DemBombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	DemBombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( DemBombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	DemBombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Demolition.dem_a_visible" ), function ( model )
		menu:updateElementState( DemBombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Demolition.dem_a_visible"
		} )
	end )
	DemBombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_A ), function ( model )
		menu:updateElementState( DemBombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_A
		} )
	end )
	DemBombTimerWidgetA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Demolition.defending" ), function ( model )
		menu:updateElementState( DemBombTimerWidgetA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Demolition.defending"
		} )
	end )
	self:addElement( DemBombTimerWidgetA )
	self.DemBombTimerWidgetA = DemBombTimerWidgetA
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				DemBombTimerWidgetB:completeAnimation()
				self.DemBombTimerWidgetB:setLeftRight( true, false, 16, 89 )
				self.DemBombTimerWidgetB:setTopBottom( true, false, 222, 246 )
				self.DemBombTimerWidgetB:setAlpha( 1 )
				self.clipFinished( DemBombTimerWidgetB, {} )
				DemBombTimerWidgetA:completeAnimation()
				self.DemBombTimerWidgetA:setLeftRight( true, false, 16, 89 )
				self.DemBombTimerWidgetA:setTopBottom( true, false, 196, 220 )
				self.DemBombTimerWidgetA:setAlpha( 1 )
				self.clipFinished( DemBombTimerWidgetA, {} )
			end
		},
		HideForCodcaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				DemBombTimerWidgetB:completeAnimation()
				self.DemBombTimerWidgetB:setAlpha( 0 )
				self.clipFinished( DemBombTimerWidgetB, {} )
				DemBombTimerWidgetA:completeAnimation()
				self.DemBombTimerWidgetA:setAlpha( 0 )
				self.clipFinished( DemBombTimerWidgetA, {} )
			end
		},
		CodCasterLargeMap = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				DemBombTimerWidgetB:completeAnimation()
				self.DemBombTimerWidgetB:setLeftRight( true, false, 16, 89 )
				self.DemBombTimerWidgetB:setTopBottom( true, false, 248, 272 )
				self.DemBombTimerWidgetB:setAlpha( 1 )
				self.clipFinished( DemBombTimerWidgetB, {} )
				DemBombTimerWidgetA:completeAnimation()
				self.DemBombTimerWidgetA:setLeftRight( true, false, 16, 89 )
				self.DemBombTimerWidgetA:setTopBottom( true, false, 222, 246 )
				self.DemBombTimerWidgetA:setAlpha( 1 )
				self.clipFinished( DemBombTimerWidgetA, {} )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				DemBombTimerWidgetB:completeAnimation()
				self.DemBombTimerWidgetB:setLeftRight( true, false, 16, 89 )
				self.DemBombTimerWidgetB:setTopBottom( true, false, 222, 246 )
				self.DemBombTimerWidgetB:setAlpha( 1 )
				self.clipFinished( DemBombTimerWidgetB, {} )
				DemBombTimerWidgetA:completeAnimation()
				self.DemBombTimerWidgetA:setLeftRight( true, false, 16, 89 )
				self.DemBombTimerWidgetA:setTopBottom( true, false, 196, 220 )
				self.DemBombTimerWidgetA:setAlpha( 1 )
				self.clipFinished( DemBombTimerWidgetA, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HideForCodcaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller ) and not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_qs_playerhud", 1 )
			end
		},
		{
			stateName = "CodCasterLargeMap",
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DemBombTimerWidgetB:close()
		element.DemBombTimerWidgetA:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

