require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipContainerNew" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_Knife" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_TotalAmmo" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AmmoMeterColor" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipMeterColor" )

CoD.AmmoWidget_ClipInfo = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_ClipInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_ClipInfo )
	self.id = "AmmoWidget_ClipInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 135 )
	self:setTopBottom( true, false, 0, 57 )
	self.anyChildUsesUpdateState = true
	
	local Clip = CoD.AmmoWidget_ClipContainerNew.new( menu, controller )
	Clip:setLeftRight( false, true, -148, -47 )
	Clip:setTopBottom( false, true, -49, -1 )
	Clip:setAlpha( 0.8 )
	Clip:setZoom( 3 )
	Clip:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	Clip:setShaderVector( 0, 0.2, 0.5, 0, 0 )
	Clip:setShaderVector( 1, 1, 0, 0, 0 )
	Clip:setShaderVector( 2, 10, -5, 0, 0 )
	Clip:setShaderVector( 3, 4, 1, 0, 0 )
	Clip:setShaderVector( 4, 0, 0, 0, 0 )
	Clip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )
		if ammoInClip then
			Clip.Clip.Clip:setText( Engine.Localize( ammoInClip ) )
		end
	end )
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
				return not WeaponHasAmmo( controller )
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
	self:addElement( Clip )
	self.Clip = Clip
	
	local Knife = CoD.AmmoWidget_Knife.new( menu, controller )
	Knife:setLeftRight( false, true, 256, 341 )
	Knife:setTopBottom( false, true, -38, -12 )
	Knife:setAlpha( 0.9 )
	Knife:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Knife:setShaderVector( 0, 0.25, 1, 0, 0 )
	Knife:setShaderVector( 1, 1.2, 0, 0, 0 )
	Knife:setShaderVector( 2, 0, 0, 0, 0 )
	Knife:setShaderVector( 3, 3, 0, 0, 0 )
	Knife:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Knife )
	self.Knife = Knife
	
	local TotalAmmo = CoD.AmmoWidget_TotalAmmo.new( menu, controller )
	TotalAmmo:setLeftRight( false, true, -60, -2 )
	TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
	TotalAmmo:setAlpha( 0.9 )
	TotalAmmo:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TotalAmmo:setShaderVector( 0, 0.2, 1, 0, 0 )
	TotalAmmo:setShaderVector( 1, 0, 0, 0, 0 )
	TotalAmmo:setShaderVector( 2, 0, 0, 0, 0 )
	TotalAmmo:setShaderVector( 3, 0, 0, 0, 0 )
	TotalAmmo:setShaderVector( 4, 0, 0, 0, 0 )
	TotalAmmo:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoStock", function ( model )
		local ammoStock = Engine.GetModelValue( model )
		if ammoStock then
			TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( ammoStock ) )
		end
	end )
	TotalAmmo:mergeStateConditions( {
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				return not WeaponHasAmmo( controller )
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
	self:addElement( TotalAmmo )
	self.TotalAmmo = TotalAmmo
	
	local AmmoColorBar = CoD.AmmoWidget_AmmoMeterColor.new( menu, controller )
	AmmoColorBar:setLeftRight( false, true, -116, 4 )
	AmmoColorBar:setTopBottom( false, true, -4, 0 )
	AmmoColorBar:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AmmoColorBar:setShaderVector( 0, 0.2, 0.5, 0, 0 )
	AmmoColorBar:setShaderVector( 1, 0, 0, 0, 0 )
	AmmoColorBar:setShaderVector( 2, 0, 0, 0, 0 )
	AmmoColorBar:setShaderVector( 3, 0, 0, 0, 0 )
	AmmoColorBar:setShaderVector( 4, 0, 0, 0, 0 )
	AmmoColorBar:mergeStateConditions( {
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f11_local0
				if not WeaponHasAmmo( controller ) then
					f11_local0 = WeaponUsesAmmo( controller )
				else
					f11_local0 = false
				end
				return f11_local0
			end
		}
	} )
	AmmoColorBar:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ), function ( model )
		menu:updateElementState( AmmoColorBar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoStock"
		} )
	end )
	AmmoColorBar:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInClip" ), function ( model )
		menu:updateElementState( AmmoColorBar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInClip"
		} )
	end )
	AmmoColorBar:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( AmmoColorBar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:addElement( AmmoColorBar )
	self.AmmoColorBar = AmmoColorBar
	
	local ClipMeter = CoD.AmmoWidget_ClipMeterColor.new( menu, controller )
	ClipMeter:setLeftRight( false, true, -116, -50 )
	ClipMeter:setTopBottom( false, true, -4, 0 )
	ClipMeter:setZoom( 1 )
	ClipMeter:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ClipMeter:setShaderVector( 0, 0.3, 0.5, 0, 0 )
	ClipMeter:setShaderVector( 1, 0, 0, 0, 0 )
	ClipMeter:setShaderVector( 2, 0, 0, 0, 0 )
	ClipMeter:setShaderVector( 3, 0, 0, 0, 0 )
	ClipMeter:setShaderVector( 4, 0, 0, 0, 0 )
	ClipMeter:mergeStateConditions( {
		{
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				return IsLowAmmoClip( controller ) and WeaponHasAmmo( controller )
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				return not WeaponHasAmmo( controller )
			end
		}
	} )
	ClipMeter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ), function ( model )
		menu:updateElementState( ClipMeter, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoStock"
		} )
	end )
	ClipMeter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInClip" ), function ( model )
		menu:updateElementState( ClipMeter, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInClip"
		} )
	end )
	self:addElement( ClipMeter )
	self.ClipMeter = ClipMeter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
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
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( true, false, 79, 130 )
				self.AmmoColorBar:setTopBottom( true, false, 49.5, 54.5 )
				self.clipFinished( AmmoColorBar, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( true, false, 12.5, 61.5 )
				self.ClipMeter:setTopBottom( true, false, 49.5, 55.5 )
				self.clipFinished( ClipMeter, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
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
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, -56, -5 )
				self.AmmoColorBar:setTopBottom( false, true, -7.5, -2.5 )
				self.clipFinished( AmmoColorBar, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
				self.ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
				self.clipFinished( ClipMeter, {} )
			end
		},
		Knife = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
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
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, 239, 345 )
				self.AmmoColorBar:setTopBottom( false, true, -4, 0 )
				self.clipFinished( AmmoColorBar, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( true, false, 371.5, 420.5 )
				self.ClipMeter:setTopBottom( true, false, 50, 56 )
				self.clipFinished( ClipMeter, {} )
			end
		},
		Weapon3Digits = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
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
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( true, false, 79, 130 )
				self.AmmoColorBar:setTopBottom( true, false, 49.5, 54.5 )
				self.clipFinished( AmmoColorBar, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( true, false, 1.5, 64.5 )
				self.ClipMeter:setTopBottom( true, false, 49.5, 55.5 )
				self.clipFinished( ClipMeter, {} )
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
				local f24_local0
				if not WeaponUsesAmmo( controller ) then
					f24_local0 = not IsHeroWeaponGadgetCurrentWeapon( menu, controller )
				else
					f24_local0 = false
				end
				return f24_local0
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Clip:close()
		element.Knife:close()
		element.TotalAmmo:close()
		element.AmmoColorBar:close()
		element.ClipMeter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

