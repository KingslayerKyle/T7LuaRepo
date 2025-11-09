require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipContainerDummyxml" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_Knife" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_TotalAmmo" )

CoD.AmmoWidget_ClipInfoDummy = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_ClipInfoDummy.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_ClipInfoDummy )
	self.id = "AmmoWidget_ClipInfoDummy"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 135 )
	self:setTopBottom( true, false, 0, 57 )
	self.anyChildUsesUpdateState = true
	
	local Clip = CoD.AmmoWidget_ClipContainerDummyxml.new( menu, controller )
	Clip:setLeftRight( false, true, -148, -47 )
	Clip:setTopBottom( false, true, -49, -1 )
	Clip:setRGB( 1, 1, 1 )
	Clip:setAlpha( 0.8 )
	Clip:setZoom( 3 )
	Clip:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	Clip:setShaderVector( 0, 0.2, 0.5, 0, 0 )
	Clip:setShaderVector( 1, 1, 0, 0, 0 )
	Clip:setShaderVector( 2, 10, -5, 0, 0 )
	Clip:setShaderVector( 3, 4, 1, 0, 0 )
	Clip:setShaderVector( 4, 0, 0, 0, 0 )
	Clip.Clip.Clip:setText( Engine.Localize( "33" ) )
	Clip:mergeStateConditions( {
		{
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				return IsLowAmmoClip( controller ) and WeaponHasAmmo( controller )
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f3_local0
				if not WeaponHasAmmo( controller ) then
					f3_local0 = WeaponUsesAmmo( controller )
				else
					f3_local0 = false
				end
				return f3_local0
			end
		}
	} )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoStock"
		} )
	end )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInClip" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInClip"
		} )
	end )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:addElement( Clip )
	self.Clip = Clip
	
	local Knife = CoD.AmmoWidget_Knife.new( menu, controller )
	Knife:setLeftRight( false, true, 256, 341 )
	Knife:setTopBottom( false, true, -38, -12 )
	Knife:setRGB( 1, 1, 1 )
	Knife:setAlpha( 0.9 )
	Knife:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Knife:setShaderVector( 0, 0.25, 1, 0, 0 )
	Knife:setShaderVector( 1, 0, 0, 0, 0 )
	Knife:setShaderVector( 2, 0, 0, 0, 0 )
	Knife:setShaderVector( 3, 0, 0, 0, 0 )
	Knife:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Knife )
	self.Knife = Knife
	
	local TotalAmmo = CoD.AmmoWidget_TotalAmmo.new( menu, controller )
	TotalAmmo:setLeftRight( false, true, -60, -2 )
	TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
	TotalAmmo:setRGB( 1, 1, 1 )
	TotalAmmo:setAlpha( 0.9 )
	TotalAmmo:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TotalAmmo:setShaderVector( 0, 0.2, 1, 0, 0 )
	TotalAmmo:setShaderVector( 1, 0, 0, 0, 0 )
	TotalAmmo:setShaderVector( 2, 0, 0, 0, 0 )
	TotalAmmo:setShaderVector( 3, 0, 0, 0, 0 )
	TotalAmmo:setShaderVector( 4, 0, 0, 0, 0 )
	TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "333" ) )
	TotalAmmo:mergeStateConditions( {
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f7_local0
				if not WeaponHasAmmo( controller ) then
					f7_local0 = WeaponUsesAmmo( controller )
				else
					f7_local0 = false
				end
				return f7_local0
			end
		},
		{
			stateName = "HeroWeapon",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetCurrentWeapon( menu, controller )
			end
		}
	} )
	TotalAmmo:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ), function ( model )
		menu:updateElementState( TotalAmmo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoStock"
		} )
	end )
	TotalAmmo:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInClip" ), function ( model )
		menu:updateElementState( TotalAmmo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInClip"
		} )
	end )
	TotalAmmo:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( TotalAmmo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:addElement( TotalAmmo )
	self.TotalAmmo = TotalAmmo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -148, -47 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.clipFinished( Clip, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.clipFinished( TotalAmmo, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -148, -47 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.clipFinished( Clip, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.clipFinished( TotalAmmo, {} )
			end
		},
		Knife = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, 261, 362 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.clipFinished( Clip, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, -89, -4 )
				self.Knife:setTopBottom( false, true, -39, -13 )
				self.clipFinished( Knife, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, 292, 350 )
				self.TotalAmmo:setTopBottom( false, true, -37, -7 )
				self.clipFinished( TotalAmmo, {} )
			end
		},
		Weapon3Digits = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -154, -53 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.clipFinished( Clip, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.clipFinished( TotalAmmo, {} )
			end
		},
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -148, -47 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.clipFinished( Clip, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.clipFinished( TotalAmmo, {} )
			end
		}
	}
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
				local f18_local0
				if not WeaponUsesAmmo( controller ) then
					f18_local0 = not IsHeroWeaponGadgetCurrentWeapon( menu, controller )
				else
					f18_local0 = false
				end
				return f18_local0
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
	self.close = function ( self )
		self.Clip:close()
		self.Knife:close()
		self.TotalAmmo:close()
		CoD.AmmoWidget_ClipInfoDummy.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

