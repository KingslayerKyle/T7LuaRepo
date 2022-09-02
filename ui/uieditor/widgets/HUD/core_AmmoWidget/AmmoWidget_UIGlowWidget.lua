-- 9412ff5166178ee6a3e4cc0ebb677faf
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_UIGlowWidget = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_UIGlowWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_UIGlowWidget )
	self.id = "AmmoWidget_UIGlowWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 57 )
	
	local UIGlow = LUI.UIImage.new()
	UIGlow:setLeftRight( true, false, 6, 272.67 )
	UIGlow:setTopBottom( true, false, -51, 99.48 )
	UIGlow:setAlpha( 0.6 )
	UIGlow:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_uiglow" ) )
	UIGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( UIGlow )
	self.UIGlow = UIGlow
	
	local UIGlowKnife = LUI.UIImage.new()
	UIGlowKnife:setLeftRight( true, false, 8, 271.99 )
	UIGlowKnife:setTopBottom( true, false, -51, 99.48 )
	UIGlowKnife:setAlpha( 0.6 )
	UIGlowKnife:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_uiglowknife" ) )
	UIGlowKnife:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( UIGlowKnife )
	self.UIGlowKnife = UIGlowKnife
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				UIGlow:completeAnimation()
				self.UIGlow:setAlpha( 0.6 )
				self.clipFinished( UIGlow, {} )

				UIGlowKnife:completeAnimation()
				self.UIGlowKnife:setAlpha( 0 )
				self.clipFinished( UIGlowKnife, {} )
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				UIGlow:completeAnimation()
				self.UIGlow:setAlpha( 0.6 )
				self.clipFinished( UIGlow, {} )

				UIGlowKnife:completeAnimation()
				self.UIGlowKnife:setAlpha( 0 )
				self.clipFinished( UIGlowKnife, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				UIGlow:completeAnimation()
				self.UIGlow:setAlpha( 0.6 )
				self.clipFinished( UIGlow, {} )

				UIGlowKnife:completeAnimation()
				self.UIGlowKnife:setAlpha( 0 )
				self.clipFinished( UIGlowKnife, {} )
			end
		},
		Knife = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				UIGlow:completeAnimation()
				self.UIGlow:setAlpha( 0 )
				self.clipFinished( UIGlow, {} )

				UIGlowKnife:completeAnimation()
				self.UIGlowKnife:setAlpha( 0.6 )
				self.clipFinished( UIGlowKnife, {} )
			end
		},
		Weapon3Digits = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				UIGlow:completeAnimation()
				self.UIGlow:setAlpha( 0.6 )
				self.clipFinished( UIGlow, {} )

				UIGlowKnife:completeAnimation()
				self.UIGlowKnife:setAlpha( 0 )
				self.clipFinished( UIGlowKnife, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "WeaponDual",
			condition = function ( menu, element, event )
				return WeaponUsesAmmo( controller ) and IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 )
			end
		},
		{
			stateName = "Weapon",
			condition = function ( menu, element, event )
				return WeaponUsesAmmo( controller ) and not IsWeaponClipGreaterThanOrEqualTo( controller, 100 )
			end
		},
		{
			stateName = "Knife",
			condition = function ( menu, element, event )
				return not WeaponUsesAmmo( controller )
			end
		},
		{
			stateName = "Weapon3Digits",
			condition = function ( menu, element, event )
				return IsWeaponClipGreaterThanOrEqualTo( controller, 100 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

