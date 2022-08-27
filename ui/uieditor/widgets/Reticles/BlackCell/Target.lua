-- 327ea15bc4d19d7e5a133a6033d5b09f
-- This hash is used for caching, delete to decompile the file again

CoD.Target = InheritFrom( LUI.UIElement )
CoD.Target.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Target )
	self.id = "Target"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 111 )
	self:setTopBottom( true, false, 0, 52 )
	
	local timerbgshadow = LUI.UIImage.new()
	timerbgshadow:setLeftRight( false, false, -117, 135 )
	timerbgshadow:setTopBottom( false, false, -101, 91 )
	timerbgshadow:setRGB( 0, 0, 0 )
	timerbgshadow:setAlpha( 0.8 )
	timerbgshadow:setImage( RegisterImage( "uie_t7_hud_rocketlauncher_timer" ) )
	self:addElement( timerbgshadow )
	self.timerbgshadow = timerbgshadow
	
	local timerbg = LUI.UIImage.new()
	timerbg:setLeftRight( false, false, -117, 135 )
	timerbg:setTopBottom( false, false, -101, 91 )
	timerbg:setImage( RegisterImage( "uie_t7_hud_rocketlauncher_timer" ) )
	self:addElement( timerbg )
	self.timerbg = timerbg
	
	local iconshadow = LUI.UIImage.new()
	iconshadow:setLeftRight( false, false, -76, 44 )
	iconshadow:setTopBottom( false, false, -69, 63 )
	iconshadow:setRGB( 0, 0, 0 )
	iconshadow:setImage( RegisterImage( "uie_t7_hud_rocketlauncher_targetreticle" ) )
	self:addElement( iconshadow )
	self.iconshadow = iconshadow
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( false, false, -76, 44 )
	icon:setTopBottom( false, false, -69, 63 )
	icon:setImage( RegisterImage( "uie_t7_hud_rocketlauncher_targetreticle" ) )
	self:addElement( icon )
	self.icon = icon
	
	local TimerShadow = LUI.UITightText.new()
	TimerShadow:setLeftRight( false, false, 19.5, 63.5 )
	TimerShadow:setTopBottom( false, false, -20, 20 )
	TimerShadow:setRGB( 0, 0, 0 )
	TimerShadow:setTTF( "fonts/default.ttf" )
	TimerShadow:subscribeToGlobalModel( controller, "CurrentWeapon", "lockedOnEnemyMissilesRemaining", function ( model )
		local lockedOnEnemyMissilesRemaining = Engine.GetModelValue( model )
		if lockedOnEnemyMissilesRemaining then
			TimerShadow:setText( Engine.Localize( lockedOnEnemyMissilesRemaining ) )
		end
	end )
	self:addElement( TimerShadow )
	self.TimerShadow = TimerShadow
	
	local Timer0 = LUI.UITightText.new()
	Timer0:setLeftRight( false, false, 19.5, 63.5 )
	Timer0:setTopBottom( false, false, -20, 20 )
	Timer0:setTTF( "fonts/default.ttf" )
	Timer0:subscribeToGlobalModel( controller, "CurrentWeapon", "lockedOnEnemyMissilesRemaining", function ( model )
		local lockedOnEnemyMissilesRemaining = Engine.GetModelValue( model )
		if lockedOnEnemyMissilesRemaining then
			Timer0:setText( Engine.Localize( lockedOnEnemyMissilesRemaining ) )
		end
	end )
	self:addElement( Timer0 )
	self.Timer0 = Timer0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				timerbgshadow:completeAnimation()
				self.timerbgshadow:setAlpha( 0 )
				self.clipFinished( timerbgshadow, {} )
				timerbg:completeAnimation()
				self.timerbg:setAlpha( 0 )
				self.clipFinished( timerbg, {} )
				iconshadow:completeAnimation()
				self.iconshadow:setAlpha( 0 )
				self.clipFinished( iconshadow, {} )
				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				self.clipFinished( icon, {} )
				TimerShadow:completeAnimation()
				self.TimerShadow:setAlpha( 0 )
				self.clipFinished( TimerShadow, {} )
				Timer0:completeAnimation()
				self.Timer0:setAlpha( 0 )
				self.clipFinished( Timer0, {} )
			end
		},
		LockedOn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				timerbgshadow:completeAnimation()
				self.timerbgshadow:setAlpha( 0.8 )
				self.clipFinished( timerbgshadow, {} )
				timerbg:completeAnimation()
				self.timerbg:setAlpha( 1 )
				self.clipFinished( timerbg, {} )
				iconshadow:completeAnimation()
				self.iconshadow:setAlpha( 0.8 )
				self.clipFinished( iconshadow, {} )
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.clipFinished( icon, {} )
				TimerShadow:completeAnimation()
				self.TimerShadow:setAlpha( 0.8 )
				self.clipFinished( TimerShadow, {} )
				Timer0:completeAnimation()
				self.Timer0:setAlpha( 1 )
				self.clipFinished( Timer0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "LockedOn",
			condition = function ( menu, element, event )
				return IsModelValueEnumBitSet( controller, "currentWeapon.lockedOnEnemy", Enum.RocketLauncherTargetStatesFlags.ROCKET_LAUNCHER_TARGET_FOUND )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TimerShadow:close()
		element.Timer0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

