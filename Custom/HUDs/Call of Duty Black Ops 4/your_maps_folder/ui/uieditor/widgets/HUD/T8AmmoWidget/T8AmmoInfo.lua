CoD.T8AmmoInfo = InheritFrom( LUI.UIElement )
CoD.T8AmmoInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T8AmmoInfo )
	self.id = "T8AmmoInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	self.AmmoDivider = LUI.UIImage.new()
    self.AmmoDivider:setLeftRight( false, true, -83, -41 )
    self.AmmoDivider:setTopBottom( false, true, -51.5, -50.5 )
    self.AmmoDivider:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( self.AmmoDivider )

    self.AmmoClip = LUI.UIText.new()
    self.AmmoClip:setLeftRight( false, true, -108, -16 )
    self.AmmoClip:setTopBottom( false, true, -80, -45 )
    self.AmmoClip:setTTF( "fonts/skorzhen.ttf" )
	self.AmmoClip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.AmmoClip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )

		if ammoInClip then
			if IsLowAmmoClip( controller ) then
				self.AmmoClip:setRGB( 1, 0.33, 0.33 )
			else
				self.AmmoClip:setRGB( 1, 1, 1 )
			end

			self.AmmoClip:setText( Engine.Localize( ammoInClip ) )
		end
	end )
    self:addElement( self.AmmoClip )

	self.AmmoClipDW = LUI.UIText.new()
	self.AmmoClipDW:setLeftRight( false, true, -122, -30 )
	self.AmmoClipDW:setTopBottom( false, true, -72, -47 )
    self.AmmoClipDW:setTTF( "fonts/skorzhen.ttf" )
	self.AmmoClipDW:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.AmmoClipDW:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInDWClip", function ( model )
		local ammoInDWClip = Engine.GetModelValue( model )

		if ammoInDWClip then
			if IsLowAmmoDWClip( controller ) then
				self.AmmoClipDW:setRGB( 1, 0.33, 0.33 )
			else
				self.AmmoClipDW:setRGB( 1, 1, 1 )
			end

			self.AmmoClipDW:setText( Engine.Localize( ammoInDWClip ) )
		end
	end )
    self:addElement( self.AmmoClipDW )

	self.AmmoStock = LUI.UIText.new()
    self.AmmoStock:setLeftRight( false, true, -108, -16 )
    self.AmmoStock:setTopBottom( false, true, -48, -34 )
	self.AmmoStock:setTTF( "fonts/skorzhen.ttf" )
	self.AmmoStock:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
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
				self:setupElementClipCounter( 4 )
				
				self.AmmoDivider:completeAnimation()
				self.AmmoDivider:setAlpha( 1 )
				self.clipFinished( self.AmmoDivider, {} )
	
				self.AmmoClip:completeAnimation()
				self.AmmoClip:setAlpha( 1 )
				self.AmmoClip:setLeftRight( false, true, -108, -16 )
				self.AmmoClip:setTopBottom( false, true, -80, -45 )
				self.clipFinished( self.AmmoClip, {} )
				
				self.AmmoClipDW:completeAnimation()
				self.AmmoClipDW:setAlpha( 0 )
				self.clipFinished( self.AmmoClipDW, {} )
	
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
	
					element:setRGB( 1, 1, 1 )
	
					element:setTopBottom( false, true, -90, -35 )
	
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
	
					element:setRGB( 1, 0.33, 0.33 )
	
					element:setTopBottom( false, true, -80, -45 )
	
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
				self:setupElementClipCounter( 4 )
				
				self.AmmoDivider:completeAnimation()
				self.AmmoDivider:setAlpha( 0 )
				self.clipFinished( self.AmmoDivider, {} )
	
				self.AmmoClip:completeAnimation()
				self.AmmoClip:setAlpha( 0 )
				self.clipFinished( self.AmmoClip, {} )
				
				self.AmmoClipDW:completeAnimation()
				self.AmmoClipDW:setAlpha( 0 )
				self.clipFinished( self.AmmoClipDW, {} )
				
				self.AmmoStock:completeAnimation()
				self.AmmoStock:setAlpha( 0 )
				self.clipFinished( self.AmmoStock, {} )
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				
				self.AmmoDivider:completeAnimation()
				self.AmmoDivider:setAlpha( 1 )
				self.clipFinished( self.AmmoDivider, {} )
	
				self.AmmoClip:completeAnimation()
				self.AmmoClip:setAlpha( 1 )
				self.AmmoClip:setLeftRight( false, true, -94, -2 )
				self.AmmoClip:setTopBottom( false, true, -72, -47 )
				self.clipFinished( self.AmmoClip, {} )
				
				self.AmmoClipDW:completeAnimation()
				self.AmmoClipDW:setAlpha( 1 )
				self.clipFinished( self.AmmoClipDW, {} )
				
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
		element.AmmoClip:close()
		element.AmmoClipDW:close()
		element.AmmoStock:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
