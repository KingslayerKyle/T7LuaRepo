local SetAmmoText = function ( controller, element )
	local ammoInClip = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInClip" ) )
	local ammoInDWClip = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInDWClip" ) )
	local ammoStock = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ) )

	if ammoInClip ~= nil and ammoInDWClip ~= nil and ammoStock ~= nil then
		if ammoInDWClip ~= -1 then
			element:setText( Engine.Localize( ammoInDWClip .. " | " .. ammoInClip .. "/" .. ammoStock ) )

			if IsLowAmmoClip( controller ) then
				element:setText( Engine.Localize( ammoInDWClip .. " | ^1" .. ammoInClip .. "^7/" .. ammoStock ) )
			end

			if IsLowAmmoDWClip( controller ) then
				element:setText( Engine.Localize( "^1" .. ammoInDWClip .. "^7 | " .. ammoInClip .. "/" .. ammoStock ) )
			end

			if IsLowAmmoClip( controller ) and IsLowAmmoDWClip( controller ) then
				element:setText( Engine.Localize( "^1" .. ammoInDWClip .. " ^7|^1 " .. ammoInClip .. "^7/" .. ammoStock ) )
			end
		else
			element:setText( Engine.Localize( ammoInClip .. "/" .. ammoStock ) )
			
			if IsLowAmmoClip( controller ) then
				element:setText( Engine.Localize( "^1" .. ammoInClip .. "^7/" .. ammoStock ) )
			end
		end
	end
end

CoD.T6AmmoInfo = InheritFrom( LUI.UIElement )
CoD.T6AmmoInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T6AmmoInfo )
	self.id = "T6AmmoInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

    self.AmmoClip = LUI.UIText.new()
    self.AmmoClip:setLeftRight( true, true, 0, -119 )
    self.AmmoClip:setTopBottom( false, true, -94, -48.5 )
    self.AmmoClip:setTTF( "fonts/bigFont.ttf" )
	self.AmmoClip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.AmmoClip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		SetAmmoText( controller, self.AmmoClip )
	end )
	self.AmmoClip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInDWClip", function ( model )
		SetAmmoText( controller, self.AmmoClip )
	end )
	self.AmmoClip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoStock", function ( model )
		SetAmmoText( controller, self.AmmoClip )
	end )
    self:addElement( self.AmmoClip )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.AmmoClip:completeAnimation()
				self.AmmoClip:setAlpha( 1 )
				self.clipFinished( self.AmmoClip, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.AmmoClip:completeAnimation()
				self.AmmoClip:setAlpha( 0 )
				self.clipFinished( self.AmmoClip, {} )
			end
		},
		AmmoPulse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local Anim1Stage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 1 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local Anim1Stage1 = function ( element, event )
					if event.interrupted then
						Anim1Stage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )

						element:setAlpha( 0 )

						element:registerEventHandler( "transition_complete_keyframe", Anim1Stage2 )
					end
				end

				self.AmmoClip:completeAnimation()
				self.AmmoClip:setAlpha( 1 )
				Anim1Stage1( self.AmmoClip, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AmmoClip:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
