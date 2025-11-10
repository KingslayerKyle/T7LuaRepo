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
	
	local timerbg = LUI.UIImage.new()
	timerbg:setLeftRight( false, false, -117, 135 )
	timerbg:setTopBottom( false, false, -101, 91 )
	timerbg:setImage( RegisterImage( "uie_t7_hud_rocketlauncher_timer" ) )
	self:addElement( timerbg )
	self.timerbg = timerbg
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( false, false, -76, 44 )
	icon:setTopBottom( false, false, -69, 63 )
	icon:setImage( RegisterImage( "uie_t7_hud_rocketlauncher_targetreticle" ) )
	self:addElement( icon )
	self.icon = icon
	
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
				self:setupElementClipCounter( 3 )
				timerbg:completeAnimation()
				self.timerbg:setAlpha( 0 )
				self.clipFinished( timerbg, {} )
				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				self.clipFinished( icon, {} )
				Timer0:completeAnimation()
				self.Timer0:setAlpha( 0 )
				self.clipFinished( Timer0, {} )
			end
		},
		LockedOn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				timerbg:completeAnimation()
				self.timerbg:setAlpha( 1 )
				self.clipFinished( timerbg, {} )
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.clipFinished( icon, {} )
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
		element.Timer0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

