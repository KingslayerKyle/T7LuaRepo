CoD.AmmoWidget_AbilityAftStroke = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_AbilityAftStroke.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_AbilityAftStroke )
	self.id = "AmmoWidget_AbilityAftStroke"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 47 )
	self:setTopBottom( true, false, 0, 57 )
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( true, true, 13.33, -13.67 )
	Image60:setTopBottom( true, true, 28, -26.33 )
	Image60:setAlpha( 0.4 )
	Image60:setZRot( -30 )
	Image60:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilitystrokeafthorz" ) )
	Image60:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image60 )
	self.Image60 = Image60
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, true, 22.33, -22 )
	Image4:setTopBottom( true, true, 1, 0 )
	Image4:setAlpha( 0.4 )
	Image4:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilitystrokeaftvert" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, true, 0, 0.33 )
	Image5:setTopBottom( true, true, 0, 0.33 )
	Image5:setAlpha( 0.47 )
	Image5:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilitystrokefore" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, true, 13.33, -13.67 )
	Image6:setTopBottom( true, true, 28, -26.33 )
	Image6:setAlpha( 0.4 )
	Image6:setZRot( 30 )
	Image6:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilitystrokeafthorz" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
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

