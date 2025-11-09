require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_LowAmmoGlowContainer" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_ClipContainerNew" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_Knife" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_Fist" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_TotalAmmo" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipMeterColor" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_ClipContainerHero" )

CoD.AmmoWidgetMP_ClipInfo = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_ClipInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_ClipInfo )
	self.id = "AmmoWidgetMP_ClipInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 135 )
	self:setTopBottom( true, false, 0, 57 )
	self.anyChildUsesUpdateState = true
	
	local AmmoWidgetMPLowAmmoGlowContainer0 = CoD.AmmoWidgetMP_LowAmmoGlowContainer.new( menu, controller )
	AmmoWidgetMPLowAmmoGlowContainer0:setLeftRight( false, true, -118, -4 )
	AmmoWidgetMPLowAmmoGlowContainer0:setTopBottom( false, true, -41, -7 )
	AmmoWidgetMPLowAmmoGlowContainer0:mergeStateConditions( {
		{
			stateName = "Hero",
			condition = function ( menu, element, event )
				return UseHeroWeaponAmmoCounter( menu, controller )
			end
		},
		{
			stateName = "LowAmmoNoReserve",
			condition = function ( menu, element, event )
				local f3_local0 = IsCurrentWeaponReference( controller, "lmg_infinite" )
				if f3_local0 then
					f3_local0 = IsLowAmmoClip( controller )
					if f3_local0 then
						f3_local0 = WeaponHasAmmo( controller )
					end
				end
				return f3_local0
			end
		},
		{
			stateName = "NoAmmoNoReserve",
			condition = function ( menu, element, event )
				local f4_local0 = IsCurrentWeaponReference( controller, "lmg_infinite" )
				if f4_local0 then
					if not WeaponHasAmmo( controller ) then
						f4_local0 = WeaponUsesAmmo( controller )
					else
						f4_local0 = false
					end
				end
				return f4_local0
			end
		},
		{
			stateName = "LowAmmoDW",
			condition = function ( menu, element, event )
				local f5_local0 = IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 )
				if f5_local0 then
					f5_local0 = IsLowAmmoClip( controller )
					if f5_local0 then
						f5_local0 = WeaponHasAmmo( controller )
					end
				end
				return f5_local0
			end
		},
		{
			stateName = "NoAmmoDW",
			condition = function ( menu, element, event )
				local f6_local0 = IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 )
				if f6_local0 then
					if not WeaponHasAmmo( controller ) then
						f6_local0 = WeaponUsesAmmo( controller )
					else
						f6_local0 = false
					end
				end
				return f6_local0
			end
		},
		{
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				return IsLowAmmoClip( controller ) and WeaponHasAmmo( controller )
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f8_local0
				if not WeaponHasAmmo( controller ) then
					f8_local0 = WeaponUsesAmmo( controller )
				else
					f8_local0 = false
				end
				return f8_local0
			end
		}
	} )
	AmmoWidgetMPLowAmmoGlowContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( AmmoWidgetMPLowAmmoGlowContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	AmmoWidgetMPLowAmmoGlowContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( AmmoWidgetMPLowAmmoGlowContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	AmmoWidgetMPLowAmmoGlowContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.name" ), function ( model )
		menu:updateElementState( AmmoWidgetMPLowAmmoGlowContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.name"
		} )
	end )
	AmmoWidgetMPLowAmmoGlowContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" ), function ( model )
		menu:updateElementState( AmmoWidgetMPLowAmmoGlowContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.equippedWeaponReference"
		} )
	end )
	AmmoWidgetMPLowAmmoGlowContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ), function ( model )
		menu:updateElementState( AmmoWidgetMPLowAmmoGlowContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoStock"
		} )
	end )
	AmmoWidgetMPLowAmmoGlowContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInClip" ), function ( model )
		menu:updateElementState( AmmoWidgetMPLowAmmoGlowContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInClip"
		} )
	end )
	AmmoWidgetMPLowAmmoGlowContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInDWClip" ), function ( model )
		menu:updateElementState( AmmoWidgetMPLowAmmoGlowContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInDWClip"
		} )
	end )
	self:addElement( AmmoWidgetMPLowAmmoGlowContainer0 )
	self.AmmoWidgetMPLowAmmoGlowContainer0 = AmmoWidgetMPLowAmmoGlowContainer0
	
	local Clip = CoD.AmmoWidgetMP_ClipContainerNew.new( menu, controller )
	Clip:setLeftRight( false, true, -160, -35 )
	Clip:setTopBottom( false, true, -64, 14 )
	Clip:setZoom( 3 )
	Clip:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	Clip:setShaderVector( 0, 0, 0, 0, 0 )
	Clip:setShaderVector( 1, 1, 0, 0, 0 )
	Clip:setShaderVector( 2, 10, -3, 0, 0 )
	Clip:setShaderVector( 3, 2.5, 2.5, 0, 0 )
	Clip:setShaderVector( 4, 0, 0, 0, 0 )
	Clip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )
		if ammoInClip then
			Clip.Clip.Clip:setText( ammoInClip )
		end
	end )
	Clip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )
		if ammoInClip then
			Clip.ClipContainerPress.Clip:setText( ammoInClip )
		end
	end )
	Clip:mergeStateConditions( {
		{
			stateName = "Hero",
			condition = function ( menu, element, event )
				return UseHeroWeaponAmmoCounter( menu, controller )
			end
		},
		{
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				return IsLowAmmoClip( controller ) and WeaponHasAmmo( controller )
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f20_local0
				if not WeaponHasAmmo( controller ) then
					f20_local0 = WeaponUsesAmmo( controller )
					if f20_local0 then
						f20_local0 = not IsCurrentViewmodelWeaponGamemodeHiddenAmmo( controller )
					end
				else
					f20_local0 = false
				end
				return f20_local0
			end
		}
	} )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.name" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.name"
		} )
	end )
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
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.equippedWeaponReference"
		} )
	end )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.viewmodelWeaponName"
		} )
	end )
	self:addElement( Clip )
	self.Clip = Clip
	
	local ClipDual = CoD.AmmoWidgetMP_ClipContainerNew.new( menu, controller )
	ClipDual:setLeftRight( false, true, -222.5, -97.5 )
	ClipDual:setTopBottom( false, true, -64, 14 )
	ClipDual:setZoom( 3 )
	ClipDual:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	ClipDual:setShaderVector( 0, 0, 0, 0, 0 )
	ClipDual:setShaderVector( 1, 1, 0, 0, 0 )
	ClipDual:setShaderVector( 2, 10, -3, 0, 0 )
	ClipDual:setShaderVector( 3, 2.5, 2.5, 0, 0 )
	ClipDual:setShaderVector( 4, 0, 0, 0, 0 )
	ClipDual:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInDWClip", function ( model )
		local ammoInDWClip = Engine.GetModelValue( model )
		if ammoInDWClip then
			ClipDual.Clip.Clip:setText( ammoInDWClip )
		end
	end )
	ClipDual:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInDWClip", function ( model )
		local ammoInDWClip = Engine.GetModelValue( model )
		if ammoInDWClip then
			ClipDual.ClipContainerPress.Clip:setText( ammoInDWClip )
		end
	end )
	ClipDual:mergeStateConditions( {
		{
			stateName = "Hero",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				return IsLowAmmoDWClip( controller )
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	ClipDual:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ), function ( model )
		menu:updateElementState( ClipDual, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoStock"
		} )
	end )
	ClipDual:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInDWClip" ), function ( model )
		menu:updateElementState( ClipDual, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInDWClip"
		} )
	end )
	self:addElement( ClipDual )
	self.ClipDual = ClipDual
	
	local Knife = CoD.AmmoWidget_Knife.new( menu, controller )
	Knife:setLeftRight( false, true, 256, 341 )
	Knife:setTopBottom( false, true, -38, -12 )
	Knife:setAlpha( 0.9 )
	Knife:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
	Knife:setShaderVector( 0, 0.1, 0, 0, 0 )
	Knife:setShaderVector( 1, 0, 0, 0, 0 )
	Knife:setShaderVector( 2, 0, 0, 0, 0 )
	Knife:setShaderVector( 3, 0, 0, 0, 0 )
	Knife:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Knife )
	self.Knife = Knife
	
	local Fist = CoD.AmmoWidget_Fist.new( menu, controller )
	Fist:setLeftRight( true, false, 417.76, 453.24 )
	Fist:setTopBottom( true, false, -3.75, 70.75 )
	Fist:setAlpha( 0.9 )
	Fist:setZRot( -90 )
	Fist:setScale( 1.1 )
	Fist:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
	Fist:setShaderVector( 0, 0.1, 0, 0, 0 )
	Fist:setShaderVector( 1, 0, 0, 0, 0 )
	Fist:setShaderVector( 2, 0, 0, 0, 0 )
	Fist:setShaderVector( 3, 0, 0, 0, 0 )
	Fist:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Fist )
	self.Fist = Fist
	
	local TotalAmmo = CoD.AmmoWidgetMP_TotalAmmo.new( menu, controller )
	TotalAmmo:setLeftRight( false, true, -60, -2 )
	TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
	TotalAmmo:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	TotalAmmo:setShaderVector( 0, 0, 0, 0, 0 )
	TotalAmmo:setShaderVector( 1, 2, 0, 0, 0 )
	TotalAmmo:setShaderVector( 2, 5, -2, 0, 0 )
	TotalAmmo:setShaderVector( 3, 2, 2, 0, 0 )
	TotalAmmo:setShaderVector( 4, 0, 0, 0, 0 )
	TotalAmmo:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoStock", function ( model )
		local ammoStock = Engine.GetModelValue( model )
		if ammoStock then
			TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( ammoStock ) )
		end
	end )
	TotalAmmo:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "gun" )
			end
		},
		{
			stateName = "HeroWeapon",
			condition = function ( menu, element, event )
				return UseHeroWeaponAmmoCounter( menu, controller )
			end
		},
		{
			stateName = "WeaponNoReserve",
			condition = function ( menu, element, event )
				return IsCurrentWeaponReference( controller, "lmg_infinite" )
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f39_local0
				if not WeaponHasAmmo( controller ) then
					f39_local0 = WeaponUsesAmmo( controller )
					if f39_local0 then
						f39_local0 = not IsCurrentViewmodelWeaponGamemodeHiddenAmmo( controller )
					end
				else
					f39_local0 = false
				end
				return f39_local0
			end
		}
	} )
	TotalAmmo:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( TotalAmmo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	TotalAmmo:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( TotalAmmo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	TotalAmmo:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.name" ), function ( model )
		menu:updateElementState( TotalAmmo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.name"
		} )
	end )
	TotalAmmo:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" ), function ( model )
		menu:updateElementState( TotalAmmo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.equippedWeaponReference"
		} )
	end )
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
	TotalAmmo:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		menu:updateElementState( TotalAmmo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.viewmodelWeaponName"
		} )
	end )
	self:addElement( TotalAmmo )
	self.TotalAmmo = TotalAmmo
	
	local ClipMeter = CoD.AmmoWidget_ClipMeterColor.new( menu, controller )
	ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
	ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
	ClipMeter:setZoom( 1 )
	ClipMeter:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ClipMeter:setShaderVector( 0, 0.3, 0, 0, 0 )
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
				local f48_local0
				if not WeaponHasAmmo( controller ) then
					f48_local0 = WeaponUsesAmmo( controller )
				else
					f48_local0 = false
				end
				return f48_local0
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
	ClipMeter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( ClipMeter, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	ClipMeter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" ), function ( model )
		menu:updateElementState( ClipMeter, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.equippedWeaponReference"
		} )
	end )
	self:addElement( ClipMeter )
	self.ClipMeter = ClipMeter
	
	local AmmoColorBar = CoD.AmmoWidget_ClipMeterColor.new( menu, controller )
	AmmoColorBar:setLeftRight( true, false, 79, 128 )
	AmmoColorBar:setTopBottom( true, false, 49.5, 55.5 )
	AmmoColorBar:setZoom( 1 )
	AmmoColorBar:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AmmoColorBar:setShaderVector( 0, 0.3, 0, 0, 0 )
	AmmoColorBar:setShaderVector( 1, 0, 0, 0, 0 )
	AmmoColorBar:setShaderVector( 2, 0, 0, 0, 0 )
	AmmoColorBar:setShaderVector( 3, 0, 0, 0, 0 )
	AmmoColorBar:setShaderVector( 4, 0, 0, 0, 0 )
	AmmoColorBar:mergeStateConditions( {
		{
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f54_local0
				if not WeaponHasAmmo( controller ) then
					f54_local0 = WeaponUsesAmmo( controller )
				else
					f54_local0 = false
				end
				return f54_local0
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
	AmmoColorBar:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" ), function ( model )
		menu:updateElementState( AmmoColorBar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.equippedWeaponReference"
		} )
	end )
	self:addElement( AmmoColorBar )
	self.AmmoColorBar = AmmoColorBar
	
	local ClipHero = CoD.AmmoWidgetMP_ClipContainerHero.new( menu, controller )
	ClipHero:setLeftRight( false, true, -105, 20 )
	ClipHero:setTopBottom( false, true, -64, 14 )
	ClipHero:setZoom( 3 )
	ClipHero:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	ClipHero:setShaderVector( 0, 0, 0, 0, 0 )
	ClipHero:setShaderVector( 1, 1, 0, 0, 0 )
	ClipHero:setShaderVector( 2, 10, -3, 0, 0 )
	ClipHero:setShaderVector( 3, 2.5, 2.5, 0, 0 )
	ClipHero:setShaderVector( 4, 0, 0, 0, 0 )
	ClipHero:mergeStateConditions( {
		{
			stateName = "Hero",
			condition = function ( menu, element, event )
				return UseHeroWeaponAmmoCounter( menu, controller )
			end
		}
	} )
	ClipHero:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( ClipHero, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	ClipHero:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( ClipHero, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	ClipHero:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.name" ), function ( model )
		menu:updateElementState( ClipHero, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.name"
		} )
	end )
	self:addElement( ClipHero )
	self.ClipHero = ClipHero
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -160, -35 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setAlpha( 0 )
				self.clipFinished( ClipDual, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( true, false, 417.76, 453.24 )
				self.Fist:setTopBottom( true, false, -3.75, 70.75 )
				self.Fist:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
				self.Fist:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.Fist:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
				self.ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
				self.ClipMeter:setAlpha( 1 )
				self.clipFinished( ClipMeter, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( true, false, 79, 128 )
				self.AmmoColorBar:setTopBottom( true, false, 49.5, 55.5 )
				self.clipFinished( AmmoColorBar, {} )
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -106, 19 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				self.clipFinished( ClipHero, {} )
			end,
			AmmoUpdate = function ()
				self:setupElementClipCounter( 1 )
				local TotalAmmoFrame2 = function ( TotalAmmo, event )
					local TotalAmmoFrame3 = function ( TotalAmmo, event )
						if not event.interrupted then
							TotalAmmo:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
						end
						TotalAmmo:setLeftRight( false, true, -60, -2 )
						TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
						TotalAmmo:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( TotalAmmo, event )
						else
							TotalAmmo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TotalAmmoFrame3( TotalAmmo, event )
						return 
					else
						TotalAmmo:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
						TotalAmmo:setLeftRight( false, true, -60.5, -2.5 )
						TotalAmmo:setTopBottom( false, true, -6.5, 23.5 )
						TotalAmmo:setRGB( 0, 0, 0 )
						TotalAmmo:registerEventHandler( "transition_complete_keyframe", TotalAmmoFrame3 )
					end
				end
				
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				TotalAmmoFrame2( TotalAmmo, {} )
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 2 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( false, true, -106, 19 )
					Clip:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -160, -35 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				ClipFrame2( Clip, {} )
				local ClipHeroFrame2 = function ( ClipHero, event )
					if not event.interrupted then
						ClipHero:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					ClipHero:setLeftRight( false, true, -106, 19 )
					ClipHero:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( ClipHero, event )
					else
						ClipHero:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -160, -35 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				ClipHeroFrame2( ClipHero, {} )
			end,
			WeaponNoReserve = function ()
				self:setupElementClipCounter( 2 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( false, true, -106, 19 )
					Clip:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -160, -35 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				ClipFrame2( Clip, {} )
				local ClipHeroFrame2 = function ( ClipHero, event )
					if not event.interrupted then
						ClipHero:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					ClipHero:setLeftRight( false, true, -106, 19 )
					ClipHero:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( ClipHero, event )
					else
						ClipHero:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -160, -35 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				ClipHeroFrame2( ClipHero, {} )
			end
		},
		HiddenGamemodeWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, 261, 362 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setAlpha( 0 )
				self.clipFinished( ClipDual, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( true, false, 417.76, 453.24 )
				self.Fist:setTopBottom( true, false, -3.75, 70.75 )
				self.Fist:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
				self.Fist:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.Fist:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, 292, 350 )
				self.TotalAmmo:setTopBottom( false, true, -37, -7 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
				self.ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
				self.ClipMeter:setAlpha( 1 )
				self.clipFinished( ClipMeter, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, 285.5, 334.5 )
				self.AmmoColorBar:setTopBottom( false, true, -7, -1 )
				self.clipFinished( AmmoColorBar, {} )
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, 247.5, 372.5 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				self.clipFinished( ClipHero, {} )
			end
		},
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -106, 19 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setAlpha( 0 )
				self.clipFinished( ClipDual, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( true, false, 417.76, 453.24 )
				self.Fist:setTopBottom( true, false, -3.75, 70.75 )
				self.Fist:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
				self.Fist:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.Fist:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 0 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
				self.ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
				self.ClipMeter:setAlpha( 0 )
				self.clipFinished( ClipMeter, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( true, false, 79, 128 )
				self.AmmoColorBar:setTopBottom( true, false, 49.5, 55.5 )
				self.clipFinished( AmmoColorBar, {} )
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -106, 19 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				self.clipFinished( ClipHero, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( false, true, -160, -35 )
					Clip:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -106, 19 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				ClipFrame2( Clip, {} )
				local ClipHeroFrame2 = function ( ClipHero, event )
					if not event.interrupted then
						ClipHero:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					ClipHero:setLeftRight( false, true, -160, -35 )
					ClipHero:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( ClipHero, event )
					else
						ClipHero:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -106, 19 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				ClipHeroFrame2( ClipHero, {} )
			end,
			Weapon3Digits = function ()
				self:setupElementClipCounter( 2 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( false, true, -165, -40 )
					Clip:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -106, 19 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				ClipFrame2( Clip, {} )
				local ClipHeroFrame2 = function ( ClipHero, event )
					if not event.interrupted then
						ClipHero:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					ClipHero:setLeftRight( false, true, -165, -40 )
					ClipHero:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( ClipHero, event )
					else
						ClipHero:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -106, 19 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				ClipHeroFrame2( ClipHero, {} )
			end,
			Weapon = function ()
				self:setupElementClipCounter( 3 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( false, true, -160, -35 )
					Clip:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -106, 19 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				ClipFrame2( Clip, {} )
				local TotalAmmoFrame2 = function ( TotalAmmo, event )
					if not event.interrupted then
						TotalAmmo:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
					end
					TotalAmmo:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TotalAmmo, event )
					else
						TotalAmmo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setAlpha( 0 )
				TotalAmmoFrame2( TotalAmmo, {} )
				local ClipHeroFrame2 = function ( ClipHero, event )
					if not event.interrupted then
						ClipHero:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					ClipHero:setLeftRight( false, true, -160, -35 )
					ClipHero:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( ClipHero, event )
					else
						ClipHero:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -106, 19 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				ClipHeroFrame2( ClipHero, {} )
			end
		},
		WeaponNoReserve = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -106, 19 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setAlpha( 0 )
				self.clipFinished( ClipDual, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( true, false, 417.76, 453.24 )
				self.Fist:setTopBottom( true, false, -3.75, 70.75 )
				self.Fist:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
				self.Fist:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.Fist:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 0 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
				self.ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
				self.ClipMeter:setAlpha( 0 )
				self.clipFinished( ClipMeter, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, -56, -7 )
				self.AmmoColorBar:setTopBottom( false, true, -7.5, -1.5 )
				self.clipFinished( AmmoColorBar, {} )
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -106, 19 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				self.clipFinished( ClipHero, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( false, true, -160, -35 )
					Clip:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -106, 19 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				ClipFrame2( Clip, {} )
				local ClipHeroFrame2 = function ( ClipHero, event )
					if not event.interrupted then
						ClipHero:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					ClipHero:setLeftRight( false, true, -160, -35 )
					ClipHero:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( ClipHero, event )
					else
						ClipHero:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -106, 19 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				ClipHeroFrame2( ClipHero, {} )
			end,
			Weapon3Digits = function ()
				self:setupElementClipCounter( 2 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( false, true, -165, -40 )
					Clip:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -106, 19 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				ClipFrame2( Clip, {} )
				local ClipHeroFrame2 = function ( ClipHero, event )
					if not event.interrupted then
						ClipHero:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					ClipHero:setLeftRight( false, true, -165, -40 )
					ClipHero:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( ClipHero, event )
					else
						ClipHero:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -106, 19 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				ClipHeroFrame2( ClipHero, {} )
			end,
			Weapon = function ()
				self:setupElementClipCounter( 3 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( false, true, -160, -35 )
					Clip:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -106, 19 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				ClipFrame2( Clip, {} )
				local TotalAmmoFrame2 = function ( TotalAmmo, event )
					if not event.interrupted then
						TotalAmmo:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
					end
					TotalAmmo:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TotalAmmo, event )
					else
						TotalAmmo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setAlpha( 0 )
				TotalAmmoFrame2( TotalAmmo, {} )
				local ClipHeroFrame2 = function ( ClipHero, event )
					if not event.interrupted then
						ClipHero:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					ClipHero:setLeftRight( false, true, -160, -35 )
					ClipHero:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( ClipHero, event )
					else
						ClipHero:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -106, 19 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				ClipHeroFrame2( ClipHero, {} )
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -160, -35 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setAlpha( 1 )
				self.clipFinished( ClipDual, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( true, false, 417.76, 453.24 )
				self.Fist:setTopBottom( true, false, -3.75, 70.75 )
				self.Fist:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
				self.Fist:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.Fist:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
				self.ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
				self.ClipMeter:setAlpha( 1 )
				self.clipFinished( ClipMeter, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, -55.5, -6.5 )
				self.AmmoColorBar:setTopBottom( false, true, -7.5, -1.5 )
				self.clipFinished( AmmoColorBar, {} )
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -160, -35 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				self.clipFinished( ClipHero, {} )
			end,
			AmmoUpdate = function ()
				self:setupElementClipCounter( 1 )
				local TotalAmmoFrame2 = function ( TotalAmmo, event )
					local TotalAmmoFrame3 = function ( TotalAmmo, event )
						if not event.interrupted then
							TotalAmmo:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
						end
						TotalAmmo:setLeftRight( false, true, -60, -2 )
						TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
						TotalAmmo:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( TotalAmmo, event )
						else
							TotalAmmo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TotalAmmoFrame3( TotalAmmo, event )
						return 
					else
						TotalAmmo:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
						TotalAmmo:setLeftRight( false, true, -60.5, -2.5 )
						TotalAmmo:setTopBottom( false, true, -6.5, 23.5 )
						TotalAmmo:setRGB( 0, 0, 0 )
						TotalAmmo:registerEventHandler( "transition_complete_keyframe", TotalAmmoFrame3 )
					end
				end
				
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				TotalAmmoFrame2( TotalAmmo, {} )
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 3 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( false, true, -106, 19 )
					Clip:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -160, -35 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				ClipFrame2( Clip, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setAlpha( 0 )
				self.clipFinished( ClipDual, {} )
				local ClipHeroFrame2 = function ( ClipHero, event )
					if not event.interrupted then
						ClipHero:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					ClipHero:setLeftRight( false, true, -106, 19 )
					ClipHero:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( ClipHero, event )
					else
						ClipHero:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -160, -35 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				ClipHeroFrame2( ClipHero, {} )
			end,
			Weapon3Digits = function ()
				self:setupElementClipCounter( 5 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					Clip:setLeftRight( false, true, -165, -40 )
					Clip:setTopBottom( false, true, -64, 14 )
					Clip:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -160, -35 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
				self.ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
				self.clipFinished( ClipMeter, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, -55.5, -6.5 )
				self.AmmoColorBar:setTopBottom( false, true, -7.5, -1.5 )
				self.clipFinished( AmmoColorBar, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -160, -35 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setAlpha( 0 )
				self.clipFinished( ClipDual, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( true, false, 417.76, 453.24 )
				self.Fist:setTopBottom( true, false, -3.75, 70.75 )
				self.Fist:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
				self.Fist:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.Fist:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
				self.ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
				self.ClipMeter:setAlpha( 1 )
				self.clipFinished( ClipMeter, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( true, false, 79.5, 128.5 )
				self.AmmoColorBar:setTopBottom( true, false, 49.5, 55.5 )
				self.clipFinished( AmmoColorBar, {} )
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -160, -35 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				self.clipFinished( ClipHero, {} )
			end,
			AmmoUpdate = function ()
				self:setupElementClipCounter( 1 )
				local TotalAmmoFrame2 = function ( TotalAmmo, event )
					local TotalAmmoFrame3 = function ( TotalAmmo, event )
						if not event.interrupted then
							TotalAmmo:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
						end
						TotalAmmo:setLeftRight( false, true, -60, -2 )
						TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
						TotalAmmo:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( TotalAmmo, event )
						else
							TotalAmmo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TotalAmmoFrame3( TotalAmmo, event )
						return 
					else
						TotalAmmo:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
						TotalAmmo:setLeftRight( false, true, -60.5, -2.5 )
						TotalAmmo:setTopBottom( false, true, -6.5, 23.5 )
						TotalAmmo:setRGB( 0, 0, 0 )
						TotalAmmo:registerEventHandler( "transition_complete_keyframe", TotalAmmoFrame3 )
					end
				end
				
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				TotalAmmoFrame2( TotalAmmo, {} )
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 3 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( false, true, -106, 19 )
					Clip:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -160, -35 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				ClipFrame2( Clip, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setAlpha( 0 )
				self.clipFinished( TotalAmmo, {} )
				local ClipHeroFrame2 = function ( ClipHero, event )
					if not event.interrupted then
						ClipHero:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					ClipHero:setLeftRight( false, true, -106, 19 )
					ClipHero:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( ClipHero, event )
					else
						ClipHero:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -160, -35 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				ClipHeroFrame2( ClipHero, {} )
			end,
			Weapon3Digits = function ()
				self:setupElementClipCounter( 5 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					Clip:setLeftRight( false, true, -165, -40 )
					Clip:setTopBottom( false, true, -64, 14 )
					Clip:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -160, -35 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
				self.ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
				self.clipFinished( ClipMeter, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, -55.5, -6.5 )
				self.AmmoColorBar:setTopBottom( false, true, -7.5, -1.5 )
				self.clipFinished( AmmoColorBar, {} )
			end,
			WeaponNoReserve = function ()
				self:setupElementClipCounter( 3 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( false, true, -106, 19 )
					Clip:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -160, -35 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				ClipFrame2( Clip, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setAlpha( 0 )
				self.clipFinished( ClipDual, {} )
				local ClipHeroFrame2 = function ( ClipHero, event )
					if not event.interrupted then
						ClipHero:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					ClipHero:setLeftRight( false, true, -106, 19 )
					ClipHero:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( ClipHero, event )
					else
						ClipHero:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -160, -35 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				ClipHeroFrame2( ClipHero, {} )
			end
		},
		FistGunGame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, 261, 362 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setAlpha( 0 )
				self.clipFinished( ClipDual, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( true, false, 30.02, 65.5 )
				self.Fist:setTopBottom( true, false, -3.5, 71 )
				self.Fist:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
				self.Fist:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.Fist:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, 292, 350 )
				self.TotalAmmo:setTopBottom( false, true, -37, -7 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
				self.ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
				self.ClipMeter:setAlpha( 1 )
				self.clipFinished( ClipMeter, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( true, false, 420.5, 469.5 )
				self.AmmoColorBar:setTopBottom( true, false, 50, 56 )
				self.clipFinished( AmmoColorBar, {} )
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, 247.5, 372.5 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				self.clipFinished( ClipHero, {} )
			end
		},
		Fist = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, 261, 362 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setAlpha( 0 )
				self.clipFinished( ClipDual, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( true, false, 70.76, 106.24 )
				self.Fist:setTopBottom( true, false, -3.5, 71 )
				self.Fist:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
				self.Fist:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.Fist:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, 292, 350 )
				self.TotalAmmo:setTopBottom( false, true, -37, -7 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
				self.ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
				self.ClipMeter:setAlpha( 1 )
				self.clipFinished( ClipMeter, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, 285.5, 334.5 )
				self.AmmoColorBar:setTopBottom( false, true, -7, -1 )
				self.clipFinished( AmmoColorBar, {} )
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, 247.5, 372.5 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				self.clipFinished( ClipHero, {} )
			end
		},
		KnifeGunGame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, 261, 362 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setAlpha( 0 )
				self.clipFinished( ClipDual, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, -135, -50 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( true, false, 417.76, 453.24 )
				self.Fist:setTopBottom( true, false, -3.75, 70.75 )
				self.Fist:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
				self.Fist:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.Fist:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, 292, 350 )
				self.TotalAmmo:setTopBottom( false, true, -37, -7 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
				self.ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
				self.ClipMeter:setAlpha( 1 )
				self.clipFinished( ClipMeter, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( true, false, 420.5, 469.5 )
				self.AmmoColorBar:setTopBottom( true, false, 50, 56 )
				self.clipFinished( AmmoColorBar, {} )
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, 247.5, 372.5 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				self.clipFinished( ClipHero, {} )
			end
		},
		Knife = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, 261, 362 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setAlpha( 0 )
				self.clipFinished( ClipDual, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, -89, -4 )
				self.Knife:setTopBottom( false, true, -39, -13 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( true, false, 417.76, 453.24 )
				self.Fist:setTopBottom( true, false, -3.75, 70.75 )
				self.Fist:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
				self.Fist:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.Fist:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, 292, 350 )
				self.TotalAmmo:setTopBottom( false, true, -37, -7 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
				self.ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
				self.ClipMeter:setAlpha( 1 )
				self.clipFinished( ClipMeter, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, 285.5, 334.5 )
				self.AmmoColorBar:setTopBottom( false, true, -7, -1 )
				self.clipFinished( AmmoColorBar, {} )
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, 247.5, 372.5 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				self.clipFinished( ClipHero, {} )
			end
		},
		Weapon3Digits = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -165, -40 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setAlpha( 0 )
				self.clipFinished( ClipDual, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( true, false, 417.76, 453.24 )
				self.Fist:setTopBottom( true, false, -3.75, 70.75 )
				self.Fist:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
				self.Fist:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.Fist:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fist:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -133.5, -70.5 )
				self.ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
				self.ClipMeter:setAlpha( 1 )
				self.clipFinished( ClipMeter, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( true, false, 79.5, 128.5 )
				self.AmmoColorBar:setTopBottom( true, false, 49.5, 55.5 )
				self.clipFinished( AmmoColorBar, {} )
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -165, -40 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				self.clipFinished( ClipHero, {} )
			end,
			AmmoUpdate = function ()
				self:setupElementClipCounter( 1 )
				local TotalAmmoFrame2 = function ( TotalAmmo, event )
					local TotalAmmoFrame3 = function ( TotalAmmo, event )
						if not event.interrupted then
							TotalAmmo:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Back )
						end
						TotalAmmo:setLeftRight( false, true, -60, -2 )
						TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
						TotalAmmo:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( TotalAmmo, event )
						else
							TotalAmmo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TotalAmmoFrame3( TotalAmmo, event )
						return 
					else
						TotalAmmo:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
						TotalAmmo:setLeftRight( false, true, -60.5, -2.5 )
						TotalAmmo:setTopBottom( false, true, -6.5, 23.5 )
						TotalAmmo:setRGB( 0, 0, 0 )
						TotalAmmo:registerEventHandler( "transition_complete_keyframe", TotalAmmoFrame3 )
					end
				end
				
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				TotalAmmoFrame2( TotalAmmo, {} )
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 2 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( false, true, -106, 19 )
					Clip:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -165, -40 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				ClipFrame2( Clip, {} )
				local ClipHeroFrame2 = function ( ClipHero, event )
					if not event.interrupted then
						ClipHero:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Back )
					end
					ClipHero:setLeftRight( false, true, -106, 19 )
					ClipHero:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( ClipHero, event )
					else
						ClipHero:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipHero:completeAnimation()
				self.ClipHero:setLeftRight( false, true, -165, -40 )
				self.ClipHero:setTopBottom( false, true, -64, 14 )
				ClipHeroFrame2( ClipHero, {} )
			end,
			Weapon = function ()
				self:setupElementClipCounter( 1 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					Clip:setLeftRight( false, true, -160, -35 )
					Clip:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -165, -40 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				ClipFrame2( Clip, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					Clip:setLeftRight( false, true, -160, -35 )
					Clip:setTopBottom( false, true, -64, 14 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -165, -40 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				ClipFrame2( Clip, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HiddenGamemodeWeapon",
			condition = function ( menu, element, event )
				return IsCurrentViewmodelWeaponGamemodeHiddenAmmo( controller )
			end
		},
		{
			stateName = "HeroWeapon",
			condition = function ( menu, element, event )
				return UseHeroWeaponAmmoCounter( menu, controller )
			end
		},
		{
			stateName = "WeaponNoReserve",
			condition = function ( menu, element, event )
				return IsCurrentWeaponReference( controller, "lmg_infinite" ) and not IsGameTypeEqualToString( "gun" )
			end
		},
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
			stateName = "FistGunGame",
			condition = function ( menu, element, event )
				local f137_local0
				if not WeaponUsesAmmo( controller ) then
					f137_local0 = IsCurrentWeaponReference( controller, "bare_hands" )
					if f137_local0 then
						f137_local0 = IsGameTypeEqualToString( "gun" )
					end
				else
					f137_local0 = false
				end
				return f137_local0
			end
		},
		{
			stateName = "Fist",
			condition = function ( menu, element, event )
				local f138_local0
				if not WeaponUsesAmmo( controller ) then
					f138_local0 = IsCurrentWeaponReference( controller, "bare_hands" )
				else
					f138_local0 = false
				end
				return f138_local0
			end
		},
		{
			stateName = "KnifeGunGame",
			condition = function ( menu, element, event )
				local f139_local0
				if not WeaponUsesAmmo( controller ) then
					f139_local0 = IsCurrentWeaponMeleeSecondary( controller )
					if f139_local0 then
						f139_local0 = IsGameTypeEqualToString( "gun" )
					end
				else
					f139_local0 = false
				end
				return f139_local0
			end
		},
		{
			stateName = "Knife",
			condition = function ( menu, element, event )
				local f140_local0
				if not WeaponUsesAmmo( controller ) then
					f140_local0 = IsCurrentWeaponMeleeSecondary( controller )
				else
					f140_local0 = false
				end
				return f140_local0
			end
		},
		{
			stateName = "Weapon3Digits",
			condition = function ( menu, element, event )
				return IsWeaponClipGreaterThanOrEqualTo( controller, 100 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.viewmodelWeaponName"
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.name" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.name"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.equippedWeaponReference"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AmmoWidgetMPLowAmmoGlowContainer0:close()
		element.Clip:close()
		element.ClipDual:close()
		element.Knife:close()
		element.Fist:close()
		element.TotalAmmo:close()
		element.ClipMeter:close()
		element.AmmoColorBar:close()
		element.ClipHero:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

