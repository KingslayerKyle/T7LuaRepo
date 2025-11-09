CoD.S2AmmoInfo = InheritFrom( LUI.UIElement )
CoD.S2AmmoInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S2AmmoInfo )
	self.id = "S2AmmoInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	self.AmmoDivider = LUI.UIImage.new()
    self.AmmoDivider:setLeftRight( false, true, -149.5, -149 )
    self.AmmoDivider:setTopBottom( false, true, -135.5, -103.5 )
    self.AmmoDivider:setImage( RegisterImage( "$white" ) )
    self.AmmoDivider:setRGB( 0.65, 0.63, 0.57 )
	self:addElement( self.AmmoDivider )

    self.AmmoClipShadow = LUI.UIText.new()
    self.AmmoClipShadow:setLeftRight( true, true, 0, -159.5 )
    self.AmmoClipShadow:setTopBottom( false, true, -137.5, -107.5 )
    self.AmmoClipShadow:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.AmmoClipShadow:setRGB( 0.11, 0.11, 0.11 )
	self.AmmoClipShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.AmmoClipShadow:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )

		if ammoInClip then
			self.AmmoClipShadow:setText( Engine.Localize( ammoInClip ) )
		end
	end )
    self:addElement( self.AmmoClipShadow )

    self.AmmoClip = LUI.UIText.new()
    self.AmmoClip:setLeftRight( true, true, 0, -158 )
    self.AmmoClip:setTopBottom( false, true, -139, -109 )
    self.AmmoClip:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.AmmoClip:setRGB( 0.65, 0.63, 0.57 )
	self.AmmoClip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.AmmoClip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )

		if ammoInClip then
			if IsLowAmmoClip( controller ) then
				self.AmmoClip:setRGB( 1, 0.22, 0.22 )
			else
				self.AmmoClip:setRGB( 0.65, 0.63, 0.57 )
			end

			self.AmmoClip:setText( Engine.Localize( ammoInClip ) )
		end
	end )
    self:addElement( self.AmmoClip )

    self.AmmoClipDWShadow = LUI.UIText.new()
    self.AmmoClipDWShadow:setLeftRight( true, true, 0, -209.5 )
    self.AmmoClipDWShadow:setTopBottom( false, true, -137.5, -107.5 )
    self.AmmoClipDWShadow:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.AmmoClipDWShadow:setRGB( 0.11, 0.11, 0.11 )
	self.AmmoClipDWShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.AmmoClipDWShadow:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInDWClip", function ( model )
		local ammoInDWClip = Engine.GetModelValue( model )

		if ammoInDWClip then
			self.AmmoClipDWShadow:setText( Engine.Localize( ammoInDWClip ) )
		end
	end )
    self:addElement( self.AmmoClipDWShadow )

	self.AmmoClipDW = LUI.UIText.new()
    self.AmmoClipDW:setLeftRight( true, true, 0, -208 )
    self.AmmoClipDW:setTopBottom( false, true, -139, -109 )
    self.AmmoClipDW:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.AmmoClipDW:setRGB( 0.65, 0.63, 0.57 )
	self.AmmoClipDW:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.AmmoClipDW:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInDWClip", function ( model )
		local ammoInDWClip = Engine.GetModelValue( model )

		if ammoInDWClip then
			if IsLowAmmoDWClip( controller ) then
				self.AmmoClipDW:setRGB( 1, 0.22, 0.22 )
			else
				self.AmmoClipDW:setRGB( 0.65, 0.63, 0.57 )
			end

			self.AmmoClipDW:setText( Engine.Localize( ammoInDWClip ) )
		end
	end )
    self:addElement( self.AmmoClipDW )

	self.AmmoStockShadow = LUI.UIText.new()
    self.AmmoStockShadow:setLeftRight( true, true, 0, -158.25 )
    self.AmmoStockShadow:setTopBottom( false, true, -112.75, -99.25)
	self.AmmoStockShadow:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.AmmoStockShadow:setRGB( 0.11, 0.11, 0.11 )
	self.AmmoStockShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.AmmoStockShadow:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoStock", function ( model )
		local ammoStock = Engine.GetModelValue( model )

		if ammoStock then
			self.AmmoStockShadow:setText( Engine.Localize( ammoStock ) )
		end
	end )
	self:addElement( self.AmmoStockShadow )

	self.AmmoStock = LUI.UIText.new()
    self.AmmoStock:setLeftRight( true, true, 0, -157.5 )
    self.AmmoStock:setTopBottom( false, true, -113.5, -100 )
	self.AmmoStock:setTTF( "fonts/dinnextltpro-regular.ttf" )
	self.AmmoStock:setRGB( 0.65, 0.63, 0.57 )
	self.AmmoStock:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.AmmoStock:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoStock", function ( model )
		local ammoStock = Engine.GetModelValue( model )
		
		if ammoStock then
			self.AmmoStock:setText( Engine.Localize( ammoStock ) )
		end
	end )
	self:addElement( self.AmmoStock )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				
				self.AmmoDivider:completeAnimation()
				self.AmmoDivider:setAlpha( 1 )
				self.clipFinished( self.AmmoDivider, {} )
	
				self.AmmoClipShadow:completeAnimation()
				self.AmmoClipShadow:setAlpha( 1 )
				self.clipFinished( self.AmmoClipShadow, {} )

				self.AmmoClip:completeAnimation()
				self.AmmoClip:setAlpha( 1 )
				self.clipFinished( self.AmmoClip, {} )
				
				self.AmmoClipDWShadow:completeAnimation()
				self.AmmoClipDWShadow:setAlpha( 0 )
				self.clipFinished( self.AmmoClipDWShadow, {} )

				self.AmmoClipDW:completeAnimation()
				self.AmmoClipDW:setAlpha( 0 )
				self.clipFinished( self.AmmoClipDW, {} )
	
				self.AmmoStockShadow:completeAnimation()
				self.AmmoStockShadow:setAlpha( 1 )
				self.clipFinished( self.AmmoStockShadow, {} )

				self.AmmoStock:completeAnimation()
				self.AmmoStock:setAlpha( 1 )
				self.clipFinished( self.AmmoStock, {} )
			end,
			AmmoPulse = function ()
				self:setupElementClipCounter( 1 )
			
				local AmmoPulseTransition = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
	
					element:setRGB( 0.65, 0.63, 0.57 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.AmmoClip:completeAnimation()
				self.AmmoClip:setAlpha( 0 )
				AmmoPulseTransition( self.AmmoClip, {} )
			end
		},
		AmmoPulse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				
				self.AmmoClip:completeAnimation()
				self.AmmoClip:setAlpha( 1 )
				self.clipFinished( self.AmmoClip, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
	
				local DefaultStateTransition = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
	
					element:setRGB( 1, 0.22, 0.22 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
	
				self.AmmoClip:completeAnimation()
				self.AmmoClip:setAlpha( 1 )
				DefaultStateTransition( self.AmmoClip, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				
				self.AmmoDivider:completeAnimation()
				self.AmmoDivider:setAlpha( 0 )
				self.clipFinished( self.AmmoDivider, {} )
	
				self.AmmoClipShadow:completeAnimation()
				self.AmmoClipShadow:setAlpha( 0 )
				self.clipFinished( self.AmmoClipShadow, {} )

				self.AmmoClip:completeAnimation()
				self.AmmoClip:setAlpha( 0 )
				self.clipFinished( self.AmmoClip, {} )
				
				self.AmmoClipDWShadow:completeAnimation()
				self.AmmoClipDWShadow:setAlpha( 0 )
				self.clipFinished( self.AmmoClipDWShadow, {} )

				self.AmmoClipDW:completeAnimation()
				self.AmmoClipDW:setAlpha( 0 )
				self.clipFinished( self.AmmoClipDW, {} )
	
				self.AmmoStockShadow:completeAnimation()
				self.AmmoStockShadow:setAlpha( 0 )
				self.clipFinished( self.AmmoStockShadow, {} )

				self.AmmoStock:completeAnimation()
				self.AmmoStock:setAlpha( 0 )
				self.clipFinished( self.AmmoStock, {} )
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				
				self.AmmoDivider:completeAnimation()
				self.AmmoDivider:setAlpha( 1 )
				self.clipFinished( self.AmmoDivider, {} )
	
				self.AmmoClipShadow:completeAnimation()
				self.AmmoClipShadow:setAlpha( 1 )
				self.clipFinished( self.AmmoClipShadow, {} )

				self.AmmoClip:completeAnimation()
				self.AmmoClip:setAlpha( 1 )
				self.clipFinished( self.AmmoClip, {} )
				
				self.AmmoClipDWShadow:completeAnimation()
				self.AmmoClipDWShadow:setAlpha( 1 )
				self.clipFinished( self.AmmoClipDWShadow, {} )

				self.AmmoClipDW:completeAnimation()
				self.AmmoClipDW:setAlpha( 1 )
				self.clipFinished( self.AmmoClipDW, {} )
	
				self.AmmoStockShadow:completeAnimation()
				self.AmmoStockShadow:setAlpha( 1 )
				self.clipFinished( self.AmmoStockShadow, {} )

				self.AmmoStock:completeAnimation()
				self.AmmoStock:setAlpha( 1 )
				self.clipFinished( self.AmmoStock, {} )
			end
		}
	}
	
	self:mergeStateConditions( {
		{
			stateName = "AmmoPulse",
			condition = function ( menu, element, event )
				return PulseNoAmmo( controller )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				if not WeaponUsesAmmo( controller )
				or IsModelValueEqualTo( controller, "currentWeapon.viewmodelWeaponName", "minigun_zm" )
				or IsModelValueEqualTo( controller, "currentWeapon.viewmodelWeaponName", "cymbal_monkey_zm" )
				or IsModelValueEqualTo( controller, "currentWeapon.viewmodelWeaponName", "octobomb_zm" )
				or IsModelValueEqualTo( controller, "currentWeapon.viewmodelWeaponName", "frag_grenade_zm" )
				or IsModelValueEqualTo( controller, "currentWeapon.viewmodelWeaponName", "sticky_grenade_widows_wine_zm" )
				or ModelValueStartsWith( controller, "currentWeapon.viewmodelWeaponName", "zombie_" ) then
					return true
				else
					return false
				end
			end
		},
		{
			stateName = "WeaponDual",
			condition = function ( menu, element, event )
				if WeaponUsesAmmo( controller ) then
					return IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 )
				end
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.pulseNoAmmo" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.pulseNoAmmo"
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInDWClip" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInDWClip"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AmmoDivider:close()
		element.AmmoClipShadow:close()
		element.AmmoClip:close()
		element.AmmoClipDWShadow:close()
		element.AmmoClipDW:close()
		element.AmmoStockShadow:close()
		element.AmmoStock:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
