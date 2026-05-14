local SetAmmoPosition = function ( self, controller )
	if self.AmmoClipShadow == nil or self.AmmoClip == nil or self.AmmoClipDWShadow == nil or self.AmmoClipDW == nil then
		return
	end

	local controllerModel = Engine.GetModelForController( controller )
	local ammoInClipModel = Engine.GetModel( controllerModel, "currentWeapon.ammoInClip" )
	local ammoStockModel = Engine.GetModel( controllerModel, "currentWeapon.ammoStock" )
	local ammoInClip = Engine.GetModelValue( ammoInClipModel )
	local ammoStock = Engine.GetModelValue( ammoStockModel )

	if ammoInClip == nil or ammoStock == nil then
		return
	end

	local stockDigitCount = #tostring( ammoStock )
	local clipDigitCount = #tostring( ammoInClip )

	local clipBasePosition = 217
	local clipStepPerDigit = 19
	local clipRightPosition = clipBasePosition - (math.max(stockDigitCount - 1, 0) * clipStepPerDigit)

	local dwStepPerDigit = 50
	local dwSpacingFromClip = clipDigitCount * dwStepPerDigit
	local dwRightPosition = clipRightPosition - dwSpacingFromClip

	self.AmmoClipShadow:setLeftRight( true, true, 0, clipRightPosition + 1 )
	self.AmmoClip:setLeftRight( true, true, 0, clipRightPosition )
	self.AmmoClipDWShadow:setLeftRight( true, true, 0, dwRightPosition + 1 )
	self.AmmoClipDW:setLeftRight( true, true, 0, dwRightPosition )
end

CoD.T5AmmoInfo = InheritFrom( LUI.UIElement )
CoD.T5AmmoInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T5AmmoInfo )
	self.id = "T5AmmoInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

    self.AmmoClipShadow = LUI.UIText.new()
    self.AmmoClipShadow:setLeftRight( true, true, 0 + 1, 198 + 1 )
    self.AmmoClipShadow:setTopBottom( false, true, -85 + 1, -5 + 1 )
    self.AmmoClipShadow:setTTF( "fonts/morris_sans_w04_medium_cond.ttf" )
	self.AmmoClipShadow:setRGB( 0, 0, 0 )
	self.AmmoClipShadow:setScale( 0.5 )
	self.AmmoClipShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.AmmoClipShadow:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )

		if ammoInClip then
			self.AmmoClipShadow:setText( Engine.Localize( ammoInClip ) )
		end

		SetAmmoPosition( self, controller )
	end )
    self:addElement( self.AmmoClipShadow )

    self.AmmoClip = LUI.UIText.new()
    self.AmmoClip:setLeftRight( true, true, 0, 198 )
    self.AmmoClip:setTopBottom( false, true, -85, -5 )
    self.AmmoClip:setTTF( "fonts/morris_sans_w04_medium_cond.ttf" )
	self.AmmoClip:setScale( 0.5 )
	self.AmmoClip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.AmmoClip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )

		if ammoInClip then
			if IsLowAmmoClip( controller ) then
				self.AmmoClip:setRGB( 1, 0.24, 0.22 )
			else
				self.AmmoClip:setRGB( 1, 1, 1 )
			end

			self.AmmoClip:setText( Engine.Localize( ammoInClip ) )
		end

		SetAmmoPosition( self, controller )
	end )
    self:addElement( self.AmmoClip )

	self.AmmoClipDWShadow = LUI.UIText.new()
    self.AmmoClipDWShadow:setLeftRight( true, true, 0 + 1, 198 + 1 )
    self.AmmoClipDWShadow:setTopBottom( false, true, -85 + 1, -5 + 1 )
    self.AmmoClipDWShadow:setTTF( "fonts/morris_sans_w04_medium_cond.ttf" )
	self.AmmoClipDWShadow:setRGB( 0, 0, 0 )
	self.AmmoClipDWShadow:setScale( 0.5 )
	self.AmmoClipDWShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.AmmoClipDWShadow:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInDWClip", function ( model )
		local ammoInDWClip = Engine.GetModelValue( model )

		if ammoInDWClip then
			self.AmmoClipDWShadow:setText( Engine.Localize( ammoInDWClip ) )
		end

		SetAmmoPosition( self, controller )
	end )
    self:addElement( self.AmmoClipDWShadow )

	self.AmmoClipDW = LUI.UIText.new()
    self.AmmoClipDW:setLeftRight( true, true, 0, 198 )
    self.AmmoClipDW:setTopBottom( false, true, -85, -5 )
    self.AmmoClipDW:setTTF( "fonts/morris_sans_w04_medium_cond.ttf" )
	self.AmmoClipDW:setScale( 0.5 )
	self.AmmoClipDW:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.AmmoClipDW:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInDWClip", function ( model )
		local ammoInDWClip = Engine.GetModelValue( model )

		if ammoInDWClip then
			if IsLowAmmoDWClip( controller ) then
				self.AmmoClipDW:setRGB( 1, 0.24, 0.22 )
			else
				self.AmmoClipDW:setRGB( 1, 1, 1 )
			end

			self.AmmoClipDW:setText( Engine.Localize( ammoInDWClip ) )
		end

		SetAmmoPosition( self, controller )
	end )
    self:addElement( self.AmmoClipDW )

	self.AmmoStockShadow = LUI.UIText.new()
    self.AmmoStockShadow:setLeftRight( true, true, 0 + 1, 257 + 1 )
    self.AmmoStockShadow:setTopBottom( false, true, -71 + 1, -15 + 1 )
	self.AmmoStockShadow:setTTF( "fonts/morris_sans_w04_medium_cond.ttf" )
	self.AmmoStockShadow:setRGB( 0, 0, 0 )
	self.AmmoStockShadow:setScale( 0.5 )
	self.AmmoStockShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.AmmoStockShadow:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoStock", function ( model )
		local ammoStock = Engine.GetModelValue( model )

		if ammoStock then
			self.AmmoStockShadow:setText( "/ " .. Engine.Localize( ammoStock ) )
		end

		SetAmmoPosition( self, controller )
	end )
	self:addElement( self.AmmoStockShadow )

	self.AmmoStock = LUI.UIText.new()
    self.AmmoStock:setLeftRight( true, true, 0, 257 )
    self.AmmoStock:setTopBottom( false, true, -71, -15 )
	self.AmmoStock:setTTF( "fonts/morris_sans_w04_medium_cond.ttf" )
	self.AmmoStock:setScale( 0.5 )
	self.AmmoStock:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self.AmmoStock:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoStock", function ( model )
		local ammoStock = Engine.GetModelValue( model )

		if ammoStock then
			if ammoStock == 0 then
				self.AmmoStock:setRGB( 1, 0.24, 0.22 )
			else
				self.AmmoStock:setRGB( 1, 1, 1 )
			end

			self.AmmoStock:setText( "/ " .. Engine.Localize( ammoStock ) )
		end

		SetAmmoPosition( self, controller )
	end )
	self:addElement( self.AmmoStock )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

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
						element:beginAnimation( "keyframe", 75, false, false, CoD.TweenType.Linear )
					end
	
					element:setRGB( 1, 1, 1 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.AmmoClip:completeAnimation()
				self.AmmoClip:setRGB( 1, 0.24, 0.22 )
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
			
				local AmmoPulseTransition = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 75, false, false, CoD.TweenType.Linear )
					end
	
					element:setRGB( 1, 0.24, 0.22 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.AmmoClip:completeAnimation()
				self.AmmoClip:setRGB( 1, 1, 1 )
				AmmoPulseTransition( self.AmmoClip, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

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
				self:setupElementClipCounter( 6 )

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
