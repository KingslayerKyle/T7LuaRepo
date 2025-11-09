CoD.T4AmmoWarning = InheritFrom( LUI.UIElement )
CoD.T4AmmoWarning.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T4AmmoWarning )
	self.id = "T4AmmoWarning"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.WarningTextShadow = LUI.UIText.new()
	self.WarningTextShadow:setLeftRight( true, true, 120 + 0.5, 0 + 0.5 )
	self.WarningTextShadow:setTopBottom( true, false, 382 + 0.5, 427 + 0.5 )
	self.WarningTextShadow:setText( Engine.Localize( "" ) )
	self.WarningTextShadow:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.WarningTextShadow:setRGB( 0, 0, 0 )
	self.WarningTextShadow:setScale( 0.5 )
	self:addElement( self.WarningTextShadow )

	self.WarningText = LUI.UIText.new()
	self.WarningText:setLeftRight( true, true, 120, 0 )
	self.WarningText:setTopBottom( true, false, 382, 427 )
	self.WarningText:setText( Engine.Localize( "" ) )
	self.WarningText:setTTF( "fonts/itc_legacy_sans_bold.ttf" )
	self.WarningText:setRGB( 1, 1, 1 )
	self.WarningText:setScale( 0.5 )
	self:addElement( self.WarningText )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				self.WarningTextShadow:completeAnimation()
				self.WarningTextShadow:setAlpha( 0 )
				self.WarningTextShadow:setText( Engine.Localize( "" ) )
				self.clipFinished( self.WarningTextShadow, {} )

				self.WarningText:completeAnimation()
				self.WarningText:setAlpha( 0 )
				self.WarningText:setText( Engine.Localize( "" ) )
				self.WarningText:setRGB( 1, 1, 1 )
				self.clipFinished( self.WarningText, {} )
			end
		},
		Empty = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local EmptyAnimFrame4 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 1 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local EmptyAnimFrame3 = function ( element, event )
					if event.interrupted then
						EmptyAnimFrame4( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0.5 )

						element:registerEventHandler( "transition_complete_keyframe", EmptyAnimFrame4 )
					end
				end

				local EmptyAnimFrame2 = function ( element, event )
					if event.interrupted then
						EmptyAnimFrame3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", EmptyAnimFrame3 )
					end
				end

				local EmptyAnimFrame1 = function ( element, event )
					if event.interrupted then
						EmptyAnimFrame2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0.5 )

						element:registerEventHandler( "transition_complete_keyframe", EmptyAnimFrame2 )
					end
				end

				self.WarningTextShadow:completeAnimation()
				self.WarningTextShadow:setAlpha( 1 )
				self.WarningTextShadow:setText( Engine.Localize( "No Ammo" ) )
				EmptyAnimFrame1( self.WarningTextShadow, {} )

				self.WarningText:completeAnimation()
				self.WarningText:setAlpha( 1 )
				self.WarningText:setText( Engine.Localize( "No Ammo" ) )
				self.WarningText:setRGB( 1, 0, 0 )
				EmptyAnimFrame1( self.WarningText, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Low = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local LowAnimFrame4 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 1 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local LowAnimFrame3 = function ( element, event )
					if event.interrupted then
						LowAnimFrame4( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0.5 )

						element:registerEventHandler( "transition_complete_keyframe", LowAnimFrame4 )
					end
				end

				local LowAnimFrame2 = function ( element, event )
					if event.interrupted then
						LowAnimFrame3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", LowAnimFrame3 )
					end
				end

				local LowAnimFrame1 = function ( element, event )
					if event.interrupted then
						LowAnimFrame2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0.5 )

						element:registerEventHandler( "transition_complete_keyframe", LowAnimFrame2 )
					end
				end

				self.WarningTextShadow:completeAnimation()
				self.WarningTextShadow:setAlpha( 1 )
				self.WarningTextShadow:setText( Engine.Localize( "LOW AMMO" ) )
				LowAnimFrame1( self.WarningTextShadow, {} )

				self.WarningText:completeAnimation()
				self.WarningText:setAlpha( 1 )
				self.WarningText:setText( Engine.Localize( "LOW AMMO" ) )
				self.WarningText:setRGB( 1, 1, 0 )
				LowAnimFrame1( self.WarningText, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Reload = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local ReloadAnimFrame4 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 1 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local ReloadAnimFrame3 = function ( element, event )
					if event.interrupted then
						ReloadAnimFrame4( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0.5 )

						element:registerEventHandler( "transition_complete_keyframe", ReloadAnimFrame4 )
					end
				end

				local ReloadAnimFrame2 = function ( element, event )
					if event.interrupted then
						ReloadAnimFrame3( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setAlpha( 1 )

						element:registerEventHandler( "transition_complete_keyframe", ReloadAnimFrame3 )
					end
				end

				local ReloadAnimFrame1 = function ( element, event )
					if event.interrupted then
						ReloadAnimFrame2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0.5 )

						element:registerEventHandler( "transition_complete_keyframe", ReloadAnimFrame2 )
					end
				end

				self.WarningTextShadow:completeAnimation()
				self.WarningTextShadow:setAlpha( 1 )
				self.WarningTextShadow:setText( Engine.Localize( "Reload" ) )
				ReloadAnimFrame1( self.WarningTextShadow, {} )

				self.WarningText:completeAnimation()
				self.WarningText:setAlpha( 1 )
				self.WarningText:setText( Engine.Localize( "Reload" ) )
				self.WarningText:setRGB( 1, 1, 1 )
				ReloadAnimFrame1( self.WarningText, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Empty",
			condition = function ( menu, element, event )
				local controllerModel = Engine.GetModelForController( controller )
				local ammoInClip = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoInClip" ) )
				local ammoInDWClip = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoInDWClip" ) )
				local ammoStock = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoStock" ) )

				if not WeaponUsesAmmo( controller ) then
					return false
				end

				return ammoInClip == 0 and (ammoInDWClip == -1 or ammoInDWClip == 0) and ammoStock == 0
			end
		},
		{
			stateName = "Low",
			condition = function ( menu, element, event )
				local controllerModel = Engine.GetModelForController( controller )
				local ammoStock = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoStock" ) )
				local ammoStockMax = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoStockMax" ) )

				if not WeaponUsesAmmo( controller ) then
					return false
				end

				return ammoStock <= (ammoStockMax / 4)
			end
		},
		{
			stateName = "Reload",
			condition = function ( menu, element, event )
				local controllerModel = Engine.GetModelForController( controller )
				local ammoInClip = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoInClip" ) )
				local ammoInDWClip = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.ammoInDWClip" ) )
				local clipMaxAmmo = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.clipMaxAmmo" ) )
				local clipMaxAmmoDW = Engine.GetModelValue( Engine.GetModel( controllerModel, "currentWeapon.clipMaxAmmoDW" ) )

				if not WeaponUsesAmmo( controller ) then
					return false
				end

				return ammoInClip <= (clipMaxAmmo / 4) or (ammoInDWClip ~= -1 and ammoInDWClip <= (clipMaxAmmoDW / 4))
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInClip" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInClip"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInDWClip" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInDWClip"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.clipMaxAmmo" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.clipMaxAmmo"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.clipMaxAmmoDW" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.clipMaxAmmoDW"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoStock"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStockMax" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoStockMax"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.viewmodelWeaponName"
		} )
	end )
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WarningTextShadow:close()
		element.WarningText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
