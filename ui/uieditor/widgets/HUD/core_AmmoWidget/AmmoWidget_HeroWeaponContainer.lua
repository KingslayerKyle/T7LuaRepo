-- a3a1b0a2d6e79c5b1c6c318e054ccb44
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_HeroWeapon" )

CoD.AmmoWidget_HeroWeaponContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroWeaponContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroWeaponContainer )
	self.id = "AmmoWidget_HeroWeaponContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 98 )
	self:setTopBottom( true, false, 0, 98 )
	self.anyChildUsesUpdateState = true
	
	local HeroWeaponSolid = CoD.AmmoWidget_HeroWeapon.new( menu, controller )
	HeroWeaponSolid:setLeftRight( false, false, -44, 44 )
	HeroWeaponSolid:setTopBottom( false, false, -44, 44 )
	HeroWeaponSolid:setRGB( 0, 0, 0 )
	HeroWeaponSolid:setAlpha( 0.7 )
	HeroWeaponSolid:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f2_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f2_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
				else
					f2_local0 = false
				end
				return f2_local0
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUse( menu, controller )
			end
		}
	} )
	HeroWeaponSolid:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( HeroWeaponSolid, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	HeroWeaponSolid:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( HeroWeaponSolid, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	HeroWeaponSolid:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( HeroWeaponSolid, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	HeroWeaponSolid:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( HeroWeaponSolid, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:addElement( HeroWeaponSolid )
	self.HeroWeaponSolid = HeroWeaponSolid
	
	local HeroWeaponShader = CoD.AmmoWidget_HeroWeapon.new( menu, controller )
	HeroWeaponShader:setLeftRight( false, false, -44, 44 )
	HeroWeaponShader:setTopBottom( false, false, -44, 44 )
	HeroWeaponShader:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	HeroWeaponShader:setShaderVector( 0, 0.1, 0.5, 0, 0 )
	HeroWeaponShader:setShaderVector( 1, 0, 0, 0, 0 )
	HeroWeaponShader:setShaderVector( 2, 0, 0, 0, 0 )
	HeroWeaponShader:setShaderVector( 3, 0, 0, 0, 0 )
	HeroWeaponShader:setShaderVector( 4, 0, 0, 0, 0 )
	HeroWeaponShader:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f9_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f9_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
				else
					f9_local0 = false
				end
				return f9_local0
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUse( menu, controller )
			end
		}
	} )
	HeroWeaponShader:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( HeroWeaponShader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	HeroWeaponShader:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( HeroWeaponShader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	HeroWeaponShader:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( HeroWeaponShader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	HeroWeaponShader:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( HeroWeaponShader, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:addElement( HeroWeaponShader )
	self.HeroWeaponShader = HeroWeaponShader
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				HeroWeaponSolid:completeAnimation()
				self.HeroWeaponSolid:setAlpha( 0 )
				self.clipFinished( HeroWeaponSolid, {} )

				HeroWeaponShader:completeAnimation()
				self.HeroWeaponShader:setAlpha( 0 )
				self.clipFinished( HeroWeaponShader, {} )
			end,
			WheelHide = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				HeroWeaponSolid:completeAnimation()
				self.HeroWeaponSolid:setAlpha( 0.7 )
				self.clipFinished( HeroWeaponSolid, {} )

				HeroWeaponShader:completeAnimation()
				self.HeroWeaponShader:setAlpha( 1 )
				self.clipFinished( HeroWeaponShader, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.HeroWeaponSolid:close()
		element.HeroWeaponShader:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

