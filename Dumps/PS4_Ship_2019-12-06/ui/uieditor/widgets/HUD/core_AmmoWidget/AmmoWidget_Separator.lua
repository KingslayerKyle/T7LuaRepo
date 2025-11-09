CoD.AmmoWidget_Separator = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_Separator.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_Separator )
	self.id = "AmmoWidget_Separator"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 3 )
	self:setTopBottom( true, false, 0, 35 )
	
	local ImgSeperator0 = LUI.UIImage.new()
	ImgSeperator0:setLeftRight( false, true, -3.33, 0 )
	ImgSeperator0:setTopBottom( true, false, 0, 34.67 )
	ImgSeperator0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_clipseparator" ) )
	self:addElement( ImgSeperator0 )
	self.ImgSeperator0 = ImgSeperator0
	
	self:mergeStateConditions( {
		{
			stateName = "Weapon",
			condition = function ( menu, element, event )
				return WeaponUsesAmmo( controller ) and not IsWeaponClipGreaterThanOrEqualTo( controller, 100 )
			end
		},
		{
			stateName = "Knife",
			condition = function ( menu, element, event )
				local f3_local0
				if not WeaponUsesAmmo( controller ) then
					f3_local0 = not IsHeroWeaponGadgetCurrentWeapon( menu, controller )
				else
					f3_local0 = false
				end
				return f3_local0
			end
		},
		{
			stateName = "Weapon3Digits",
			condition = function ( menu, element, event )
				return IsWeaponClipGreaterThanOrEqualTo( controller, 100 )
			end
		},
		{
			stateName = "HeroWeapon",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.clipMaxAmmo" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.clipMaxAmmo"
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

