require( "ui.uieditor.widgets.HUD.MPGametypes.Ball.BallStatus" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModelForController( controller )
	if not Engine.GetModel( f1_local0, "ballGametype" ) then
		Engine.CreateModel( f1_local0, "ballGametype.ballStatusText" )
		Engine.CreateModel( f1_local0, "ballGametype.ballHeldByEnemy" )
		Engine.CreateModel( f1_local0, "ballGametype.ballHeldByFriendly" )
	end
end

CoD.BallOverlay = InheritFrom( LUI.UIElement )
CoD.BallOverlay.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BallOverlay )
	self.id = "BallOverlay"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local BallStatus0 = CoD.BallStatus.new( menu, controller )
	BallStatus0:setLeftRight( true, false, 23, 343 )
	BallStatus0:setTopBottom( true, false, 193, 225 )
	BallStatus0:setYRot( 21 )
	BallStatus0:subscribeToGlobalModel( controller, "Ball", "ballStatusText", function ( model )
		local ballStatusText = Engine.GetModelValue( model )
		if ballStatusText then
			BallStatus0.CarrierName:setText( Engine.Localize( ballStatusText ) )
		end
	end )
	BallStatus0:subscribeToGlobalModel( controller, "Factions", "playerFactionFlagColor", function ( model )
		local playerFactionFlagColor = Engine.GetModelValue( model )
		if playerFactionFlagColor then
			BallStatus0.FriendlyFlag:setRGB( playerFactionFlagColor )
		end
	end )
	BallStatus0:subscribeToGlobalModel( controller, "Factions", "enemyFactionFlagColor", function ( model )
		local enemyFactionFlagColor = Engine.GetModelValue( model )
		if enemyFactionFlagColor then
			BallStatus0.EnemyFlag:setRGB( enemyFactionFlagColor )
		end
	end )
	self:addElement( BallStatus0 )
	self.BallStatus0 = BallStatus0
	
	local BallStatusForCodcaster = CoD.BallStatus.new( menu, controller )
	BallStatusForCodcaster:setLeftRight( true, false, 23, 343 )
	BallStatusForCodcaster:setTopBottom( true, false, 193, 225 )
	BallStatusForCodcaster:setAlpha( 0 )
	BallStatusForCodcaster:setYRot( 21 )
	BallStatusForCodcaster:subscribeToGlobalModel( controller, "Ball", "ballStatusText", function ( model )
		local ballStatusText = Engine.GetModelValue( model )
		if ballStatusText then
			BallStatusForCodcaster.CarrierName:setText( Engine.Localize( ballStatusText ) )
		end
	end )
	BallStatusForCodcaster:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			BallStatusForCodcaster.FriendlyFlag:setRGB( alliesFactionColor )
		end
	end )
	BallStatusForCodcaster:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			BallStatusForCodcaster.EnemyFlag:setRGB( axisFactionColor )
		end
	end )
	self:addElement( BallStatusForCodcaster )
	self.BallStatusForCodcaster = BallStatusForCodcaster
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BallStatus0:completeAnimation()
				self.BallStatus0:setAlpha( 0 )
				self.clipFinished( BallStatus0, {} )
				BallStatusForCodcaster:completeAnimation()
				self.BallStatusForCodcaster:setAlpha( 0 )
				self.clipFinished( BallStatusForCodcaster, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BallStatus0:completeAnimation()
				self.BallStatus0:setAlpha( 1 )
				self.clipFinished( BallStatus0, {} )
				BallStatusForCodcaster:completeAnimation()
				self.BallStatusForCodcaster:setAlpha( 0 )
				self.clipFinished( BallStatusForCodcaster, {} )
			end
		},
		VisibleForCodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BallStatus0:completeAnimation()
				self.BallStatus0:setAlpha( 0 )
				self.clipFinished( BallStatus0, {} )
				BallStatusForCodcaster:completeAnimation()
				self.BallStatusForCodcaster:setAlpha( 1 )
				self.clipFinished( BallStatusForCodcaster, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f12_local0
				if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
					f12_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
				else
					f12_local0 = false
				end
				return f12_local0
			end
		},
		{
			stateName = "VisibleForCodCaster",
			condition = function ( menu, element, event )
				local f13_local0
				if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
					f13_local0 = IsCodCaster( controller )
					if f13_local0 then
						f13_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_objective_status", 1 )
						if f13_local0 then
							f13_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_qs_playerhud", 1 )
						end
					end
				else
					f13_local0 = false
				end
				return f13_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BallStatus0:close()
		element.BallStatusForCodcaster:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

