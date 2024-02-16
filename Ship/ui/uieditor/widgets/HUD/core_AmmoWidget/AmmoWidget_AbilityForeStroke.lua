-- 468c322761d4e3198dd5ac21acc1881c
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_AbilityForeStroke = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_AbilityForeStroke.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_AbilityForeStroke )
	self.id = "AmmoWidget_AbilityForeStroke"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 57 )
	
	local BlackCircle = LUI.UIImage.new()
	BlackCircle:setLeftRight( true, false, 1.15, 47 )
	BlackCircle:setTopBottom( true, false, 0.5, 56.83 )
	BlackCircle:setAlpha( 0.3 )
	BlackCircle:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityfillcircle" ) )
	self:addElement( BlackCircle )
	self.BlackCircle = BlackCircle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				BlackCircle:completeAnimation()
				self.BlackCircle:setAlpha( 0.3 )
				self.clipFinished( BlackCircle, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Stowed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f7_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f7_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
					if f7_local0 then
						f7_local0 = not WasHeroWeaponGadgetActivated( menu )
					end
				else
					f7_local0 = false
				end
				return f7_local0
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
				local f10_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f10_local0 = IsHeroWeaponGadgetAvailable( menu, controller )
					if f10_local0 then
						f10_local0 = WasHeroWeaponGadgetActivated( menu )
					end
				else
					f10_local0 = false
				end
				return f10_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
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
