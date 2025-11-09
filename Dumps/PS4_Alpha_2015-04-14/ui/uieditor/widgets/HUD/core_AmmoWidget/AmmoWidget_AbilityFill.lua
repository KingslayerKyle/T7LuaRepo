CoD.AmmoWidget_AbilityFill = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_AbilityFill.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_AbilityFill )
	self.id = "AmmoWidget_AbilityFill"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 47 )
	self:setTopBottom( true, false, 0, 57 )
	
	local ImgAbilityFill = LUI.UIImage.new()
	ImgAbilityFill:setLeftRight( true, true, 0, 0 )
	ImgAbilityFill:setTopBottom( true, true, 0, 0 )
	ImgAbilityFill:setRGB( 1, 1, 1 )
	ImgAbilityFill:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityfill" ) )
	ImgAbilityFill:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgAbilityFill )
	self.ImgAbilityFill = ImgAbilityFill
	
	self:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f2_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f2_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
					if f2_local0 then
						f2_local0 = not WasHeroWeaponGadgetActivated( menu )
					end
				else
					f2_local0 = false
				end
				return f2_local0
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and IsHeroWeaponGadgetAvailable( menu, controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetCurrentWeapon( menu, controller ) and not IsHeroWeaponGadgetAmmoEmpty( menu, controller )
			end
		},
		{
			stateName = "Stowed",
			condition = function ( menu, element, event )
				local f5_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f5_local0 = IsHeroWeaponGadgetAvailable( menu, controller )
					if f5_local0 then
						f5_local0 = WasHeroWeaponGadgetActivated( menu )
					end
				else
					f5_local0 = false
				end
				return f5_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

