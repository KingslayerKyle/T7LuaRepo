CoD.AmmoWidget_SemiCircle = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_SemiCircle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_SemiCircle )
	self.id = "AmmoWidget_SemiCircle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 9 )
	self:setTopBottom( true, false, 0, 55 )
	
	local ImgSemiCircle0 = LUI.UIImage.new()
	ImgSemiCircle0:setLeftRight( false, false, -4.83, 4.5 )
	ImgSemiCircle0:setTopBottom( false, false, -27.5, 27.17 )
	ImgSemiCircle0:setRGB( 1, 1, 1 )
	ImgSemiCircle0:setAlpha( 0.5 )
	ImgSemiCircle0:setZoom( 1 )
	ImgSemiCircle0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_semicircle" ) )
	ImgSemiCircle0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ImgSemiCircle0 )
	self.ImgSemiCircle0 = ImgSemiCircle0
	
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
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

