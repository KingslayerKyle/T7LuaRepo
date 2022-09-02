-- 38c1f51b50b10416da9542f523b3b69f
-- This hash is used for caching, delete to decompile the file again

CoD.Timer = InheritFrom( LUI.UIElement )
CoD.Timer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Timer )
	self.id = "Timer"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 119 )
	self:setTopBottom( true, false, 0, 49 )
	
	local timerbgshadow = LUI.UIImage.new()
	timerbgshadow:setLeftRight( false, false, -124, 128 )
	timerbgshadow:setTopBottom( false, false, -99, 93 )
	timerbgshadow:setRGB( 0, 0, 0 )
	timerbgshadow:setAlpha( 0.8 )
	timerbgshadow:setImage( RegisterImage( "uie_t7_hud_rocketlauncher_timer" ) )
	self:addElement( timerbgshadow )
	self.timerbgshadow = timerbgshadow
	
	local timerbg = LUI.UIImage.new()
	timerbg:setLeftRight( false, false, -124, 128 )
	timerbg:setTopBottom( false, false, -99, 93 )
	timerbg:setImage( RegisterImage( "uie_t7_hud_rocketlauncher_timer" ) )
	self:addElement( timerbg )
	self.timerbg = timerbg
	
	local TimerShadow = LUI.UITightText.new()
	TimerShadow:setLeftRight( false, false, -52, 48 )
	TimerShadow:setTopBottom( false, false, -20, 20 )
	TimerShadow:setRGB( 0, 0, 0 )
	TimerShadow:setAlpha( 0.8 )
	TimerShadow:setTTF( "fonts/default.ttf" )
	TimerShadow:setLetterSpacing( 1 )
	TimerShadow:subscribeToGlobalModel( controller, "CurrentWeapon", "lockedOnEnemyTimeRemaining", function ( model )
		local lockedOnEnemyTimeRemaining = Engine.GetModelValue( model )
		if lockedOnEnemyTimeRemaining then
			TimerShadow:setText( NumberAsTime( lockedOnEnemyTimeRemaining ) )
		end
	end )
	self:addElement( TimerShadow )
	self.TimerShadow = TimerShadow
	
	local Timer = LUI.UITightText.new()
	Timer:setLeftRight( false, false, -52, 48 )
	Timer:setTopBottom( false, false, -20, 20 )
	Timer:setTTF( "fonts/default.ttf" )
	Timer:setLetterSpacing( 1 )
	Timer:subscribeToGlobalModel( controller, "CurrentWeapon", "lockedOnEnemyTimeRemaining", function ( model )
		local lockedOnEnemyTimeRemaining = Engine.GetModelValue( model )
		if lockedOnEnemyTimeRemaining then
			Timer:setText( NumberAsTime( lockedOnEnemyTimeRemaining ) )
		end
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				timerbgshadow:completeAnimation()
				self.timerbgshadow:setAlpha( 0 )
				self.clipFinished( timerbgshadow, {} )

				timerbg:completeAnimation()
				self.timerbg:setAlpha( 0 )
				self.clipFinished( timerbg, {} )

				TimerShadow:completeAnimation()
				self.TimerShadow:setAlpha( 0 )
				self.clipFinished( TimerShadow, {} )

				Timer:completeAnimation()
				self.Timer:setAlpha( 0 )
				self.clipFinished( Timer, {} )
			end
		},
		Targetting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				timerbgshadow:completeAnimation()
				self.timerbgshadow:setAlpha( 0.8 )
				self.clipFinished( timerbgshadow, {} )

				timerbg:completeAnimation()
				self.timerbg:setAlpha( 1 )
				self.clipFinished( timerbg, {} )

				TimerShadow:completeAnimation()
				self.TimerShadow:setAlpha( 0.8 )
				self.clipFinished( TimerShadow, {} )

				Timer:completeAnimation()
				self.Timer:setAlpha( 1 )
				self.clipFinished( Timer, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Targetting",
			condition = function ( menu, element, event )
				return IsModelValueEnumBitSet( controller, "currentWeapon.lockedOnEnemy", Enum.RocketLauncherTargetStatesFlags.ROCKET_LAUNCHER_TARGET_FOUND ) and IsModelValueGreaterThan( controller, "currentWeapon.lockedOnEnemyTimeRemaining", 0 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.lockedOnEnemy" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.lockedOnEnemy"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.lockedOnEnemyTimeRemaining" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.lockedOnEnemyTimeRemaining"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TimerShadow:close()
		element.Timer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

