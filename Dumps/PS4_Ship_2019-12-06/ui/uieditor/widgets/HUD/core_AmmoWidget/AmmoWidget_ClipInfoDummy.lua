require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_Knife" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_Fist" )
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
	
	local Knife = CoD.AmmoWidget_Knife.new( menu, controller )
	Knife:setLeftRight( false, true, 256, 341 )
	Knife:setTopBottom( false, true, -38, -12 )
	Knife:setAlpha( 0.9 )
	Knife:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Knife:setShaderVector( 0, 0.25, 1, 0, 0 )
	Knife:setShaderVector( 1, 0, 0, 0, 0 )
	Knife:setShaderVector( 2, 0, 0, 0, 0 )
	Knife:setShaderVector( 3, 0, 0, 0, 0 )
	Knife:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Knife )
	self.Knife = Knife
	
	local Fist = CoD.AmmoWidget_Fist.new( menu, controller )
	Fist:setLeftRight( false, true, 282.76, 318.24 )
	Fist:setTopBottom( false, true, -60.75, 13.75 )
	Fist:setAlpha( 0.9 )
	Fist:setZRot( -90 )
	Fist:setScale( 1.1 )
	Fist:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
	Fist:setShaderVector( 0, 0.25, 1, 0, 0 )
	Fist:setShaderVector( 1, 0, 0, 0, 0 )
	Fist:setShaderVector( 2, 0, 0, 0, 0 )
	Fist:setShaderVector( 3, 0, 0, 0, 0 )
	Fist:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Fist )
	self.Fist = Fist
	
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
	TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "333" ) )
	TotalAmmo:mergeStateConditions( {
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f2_local0
				if not WeaponHasAmmo( controller ) then
					f2_local0 = WeaponUsesAmmo( controller )
				else
					f2_local0 = false
				end
				return f2_local0
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
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( false, true, 282.76, 318.24 )
				self.Fist:setTopBottom( false, true, -60.75, 13.75 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.clipFinished( TotalAmmo, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( false, true, 282.76, 318.24 )
				self.Fist:setTopBottom( false, true, -60.75, 13.75 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.clipFinished( TotalAmmo, {} )
			end
		},
		Fist = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Fist:completeAnimation()
				self.Fist:setLeftRight( false, true, -57.24, -21.76 )
				self.Fist:setTopBottom( false, true, -62.25, 12.25 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, 292, 350 )
				self.TotalAmmo:setTopBottom( false, true, -37, -7 )
				self.clipFinished( TotalAmmo, {} )
			end
		},
		KnifeGunGame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, -135, -50 )
				self.Knife:setTopBottom( false, true, -39, -13 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( false, true, 282.76, 318.24 )
				self.Fist:setTopBottom( false, true, -60.75, 13.75 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, 292, 350 )
				self.TotalAmmo:setTopBottom( false, true, -37, -7 )
				self.clipFinished( TotalAmmo, {} )
			end
		},
		Knife = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, -89, -4 )
				self.Knife:setTopBottom( false, true, -39, -13 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( false, true, 282.76, 318.24 )
				self.Fist:setTopBottom( false, true, -60.75, 13.75 )
				self.clipFinished( Fist, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, 292, 350 )
				self.TotalAmmo:setTopBottom( false, true, -37, -7 )
				self.clipFinished( TotalAmmo, {} )
			end
		},
		Weapon3Digits = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				Fist:completeAnimation()
				self.Fist:setLeftRight( false, true, 282.76, 318.24 )
				self.Fist:setTopBottom( false, true, -60.75, 13.75 )
				self.clipFinished( Fist, {} )
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
			stateName = "Fist",
			condition = function ( menu, element, event )
				local f13_local0
				if not WeaponUsesAmmo( controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f13_local0 = IsCurrentWeaponReference( controller, "fist" )
				else
					f13_local0 = false
				end
				return f13_local0
			end
		},
		{
			stateName = "KnifeGunGame",
			condition = function ( menu, element, event )
				local f14_local0
				if not WeaponUsesAmmo( controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f14_local0 = IsCurrentWeaponMeleeSecondary( controller )
					if f14_local0 then
						f14_local0 = IsGameTypeEqualToString( "gun" )
					end
				else
					f14_local0 = false
				end
				return f14_local0
			end
		},
		{
			stateName = "Knife",
			condition = function ( menu, element, event )
				local f15_local0
				if not WeaponUsesAmmo( controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f15_local0 = IsCurrentWeaponMeleeSecondary( controller )
				else
					f15_local0 = false
				end
				return f15_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.equippedWeaponReference"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Knife:close()
		element.Fist:close()
		element.TotalAmmo:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

