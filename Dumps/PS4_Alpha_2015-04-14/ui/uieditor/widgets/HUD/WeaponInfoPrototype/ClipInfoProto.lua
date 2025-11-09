require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.ClipContainerNewProto" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.KnifeProto" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.TotalAmmoProto" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.ClipMeterInternalColorProto" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.ClipMeterInternalProto" )

CoD.ClipInfoProto = InheritFrom( LUI.UIElement )
CoD.ClipInfoProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ClipInfoProto )
	self.id = "ClipInfoProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 116 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local KnifeBackground = LUI.UIImage.new()
	KnifeBackground:setLeftRight( false, true, -103.34, 6 )
	KnifeBackground:setTopBottom( false, true, -38, 2 )
	KnifeBackground:setRGB( 0.4, 0.4, 0.4 )
	KnifeBackground:setAlpha( 0 )
	KnifeBackground:setImage( RegisterImage( "uie_t7_mp_hud_uie_weaponinfoprototype_knifebacking" ) )
	KnifeBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( KnifeBackground )
	self.KnifeBackground = KnifeBackground
	
	local TotalBackground = LUI.UIImage.new()
	TotalBackground:setLeftRight( false, true, -50, 6 )
	TotalBackground:setTopBottom( false, true, -38, 2 )
	TotalBackground:setRGB( 0.18, 0.18, 0.18 )
	TotalBackground:setAlpha( 0.6 )
	TotalBackground:setImage( RegisterImage( "uie_t7_mp_hud_uie_weaponinfoprototype_totalammobacking" ) )
	TotalBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TotalBackground )
	self.TotalBackground = TotalBackground
	
	local ClipBackground = LUI.UIImage.new()
	ClipBackground:setLeftRight( false, true, -116, -50 )
	ClipBackground:setTopBottom( false, true, -38, 0 )
	ClipBackground:setRGB( 0.4, 0.4, 0.4 )
	ClipBackground:setAlpha( 0.6 )
	ClipBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( ClipBackground )
	self.ClipBackground = ClipBackground
	
	local Clip = CoD.ClipContainerNewProto.new( menu, controller )
	Clip:setLeftRight( false, true, -118, -47 )
	Clip:setTopBottom( false, true, -43, -3 )
	Clip:setRGB( 1, 1, 1 )
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
	
	local Knife = CoD.KnifeProto.new( menu, controller )
	Knife:setLeftRight( false, true, -84, -10 )
	Knife:setTopBottom( false, true, -105, -9 )
	Knife:setRGB( 1, 1, 1 )
	Knife:setAlpha( 0 )
	self:addElement( Knife )
	self.Knife = Knife
	
	local TotalAmmo = CoD.TotalAmmoProto.new( menu, controller )
	TotalAmmo:setLeftRight( false, true, -45.5, -4.5 )
	TotalAmmo:setTopBottom( false, true, -33, -3 )
	TotalAmmo:setRGB( 1, 1, 1 )
	TotalAmmo:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoStock", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( modelValue ) )
		end
	end )
	TotalAmmo:mergeStateConditions( {
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				return not WeaponHasAmmo( controller )
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
	
	local AmmoColorBar = CoD.ClipMeterInternalColorProto.new( menu, controller )
	AmmoColorBar:setLeftRight( false, true, -116, 4 )
	AmmoColorBar:setTopBottom( false, true, -4, 0 )
	AmmoColorBar:setRGB( 1, 1, 1 )
	AmmoColorBar:mergeStateConditions( {
		{
			stateName = "HeroWeapon",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f13_local0
				if not WeaponHasAmmo( controller ) then
					f13_local0 = WeaponUsesAmmo( controller )
				else
					f13_local0 = false
				end
				return f13_local0
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
	
	local ClipMeter = CoD.ClipMeterInternalProto.new( menu, controller )
	ClipMeter:setLeftRight( false, true, -116, -50 )
	ClipMeter:setTopBottom( false, true, -4, 0 )
	ClipMeter:setRGB( 1, 1, 1 )
	ClipMeter:setAlpha( 0 )
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
				self:setupElementClipCounter( 7 )
				KnifeBackground:completeAnimation()
				self.KnifeBackground:setAlpha( 0 )
				self.clipFinished( KnifeBackground, {} )
				TotalBackground:completeAnimation()
				self.TotalBackground:setLeftRight( false, true, -50, 6 )
				self.TotalBackground:setTopBottom( false, true, -38, 2 )
				self.TotalBackground:setAlpha( 0.6 )
				self.clipFinished( TotalBackground, {} )
				ClipBackground:completeAnimation()
				self.ClipBackground:setLeftRight( false, true, -102, -50 )
				self.ClipBackground:setTopBottom( false, true, -38, 0 )
				self.clipFinished( ClipBackground, {} )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, false, -53, 18 )
				self.Clip:setTopBottom( false, true, -43, -3 )
				self.clipFinished( Clip, {} )
				Knife:completeAnimation()
				self.Knife:setAlpha( 0 )
				self.clipFinished( Knife, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, -102, 4 )
				self.AmmoColorBar:setTopBottom( false, true, -4, 0 )
				self.clipFinished( AmmoColorBar, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -50, -102 )
				self.ClipMeter:setTopBottom( false, true, -4, 0 )
				self.ClipMeter:setAlpha( 1 )
				self.clipFinished( ClipMeter, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				KnifeBackground:completeAnimation()
				self.KnifeBackground:setAlpha( 0 )
				self.clipFinished( KnifeBackground, {} )
				TotalBackground:completeAnimation()
				self.TotalBackground:setLeftRight( false, true, -50, 6 )
				self.TotalBackground:setTopBottom( false, true, -38, 2 )
				self.TotalBackground:setAlpha( 0.6 )
				self.clipFinished( TotalBackground, {} )
				ClipBackground:completeAnimation()
				self.ClipBackground:setLeftRight( false, true, -102, -50 )
				self.ClipBackground:setTopBottom( false, true, -38, 0 )
				self.ClipBackground:setAlpha( 0.6 )
				self.clipFinished( ClipBackground, {} )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, false, -53, 18 )
				self.Clip:setTopBottom( false, true, -43, -3 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				Knife:completeAnimation()
				self.Knife:setAlpha( 0 )
				self.clipFinished( Knife, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, -102, 4 )
				self.AmmoColorBar:setTopBottom( false, true, -4, 0 )
				self.AmmoColorBar:setAlpha( 1 )
				self.clipFinished( AmmoColorBar, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -50, -102 )
				self.ClipMeter:setTopBottom( false, true, -4, 0 )
				self.ClipMeter:setAlpha( 1 )
				self.clipFinished( ClipMeter, {} )
			end
		},
		Knife = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				KnifeBackground:completeAnimation()
				self.KnifeBackground:setAlpha( 0.6 )
				self.clipFinished( KnifeBackground, {} )
				TotalBackground:completeAnimation()
				self.TotalBackground:setAlpha( 0 )
				self.clipFinished( TotalBackground, {} )
				ClipBackground:completeAnimation()
				self.ClipBackground:setLeftRight( false, true, -102, 0 )
				self.ClipBackground:setTopBottom( false, true, -38, 0 )
				self.ClipBackground:setAlpha( 0 )
				self.clipFinished( ClipBackground, {} )
				Clip:completeAnimation()
				self.Clip:setAlpha( 0 )
				self.clipFinished( Clip, {} )
				Knife:completeAnimation()
				self.Knife:setAlpha( 1 )
				self.clipFinished( Knife, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setAlpha( 0 )
				self.clipFinished( TotalAmmo, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, -102, 4 )
				self.AmmoColorBar:setTopBottom( false, true, -4, 0 )
				self.clipFinished( AmmoColorBar, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setAlpha( 0 )
				self.clipFinished( ClipMeter, {} )
			end
		},
		Weapon3Digits = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				KnifeBackground:completeAnimation()
				self.KnifeBackground:setAlpha( 0 )
				self.clipFinished( KnifeBackground, {} )
				TotalBackground:completeAnimation()
				self.TotalBackground:setLeftRight( false, true, -50, 6 )
				self.TotalBackground:setTopBottom( false, true, -38, 2 )
				self.TotalBackground:setAlpha( 0.6 )
				self.clipFinished( TotalBackground, {} )
				ClipBackground:completeAnimation()
				self.ClipBackground:setLeftRight( false, true, -116, -50 )
				self.ClipBackground:setTopBottom( false, true, -38, 0 )
				self.ClipBackground:setAlpha( 0.6 )
				self.clipFinished( ClipBackground, {} )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, false, -60, 11 )
				self.Clip:setTopBottom( false, true, -43, -3 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				Knife:completeAnimation()
				self.Knife:setAlpha( 0 )
				self.clipFinished( Knife, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, -116, 4 )
				self.AmmoColorBar:setTopBottom( false, true, -4, 0 )
				self.AmmoColorBar:setAlpha( 1 )
				self.clipFinished( AmmoColorBar, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -50, -116 )
				self.ClipMeter:setTopBottom( false, true, -4, 0 )
				self.ClipMeter:setAlpha( 1 )
				self.clipFinished( ClipMeter, {} )
			end
		},
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				KnifeBackground:completeAnimation()
				self.KnifeBackground:setAlpha( 0 )
				self.clipFinished( KnifeBackground, {} )
				TotalBackground:completeAnimation()
				self.TotalBackground:setLeftRight( false, true, -50, 6 )
				self.TotalBackground:setTopBottom( false, true, -38, 2 )
				self.TotalBackground:setAlpha( 0.6 )
				self.clipFinished( TotalBackground, {} )
				ClipBackground:completeAnimation()
				self.ClipBackground:setLeftRight( false, true, -116, -50 )
				self.ClipBackground:setTopBottom( false, true, -38, 0 )
				self.ClipBackground:setAlpha( 0.6 )
				self.clipFinished( ClipBackground, {} )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -118, -47 )
				self.Clip:setTopBottom( false, true, -43, -3 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				Knife:completeAnimation()
				self.Knife:setAlpha( 0 )
				self.clipFinished( Knife, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, -116, 4 )
				self.AmmoColorBar:setTopBottom( false, true, -4, 0 )
				self.AmmoColorBar:setAlpha( 1 )
				self.clipFinished( AmmoColorBar, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( false, true, -116, -50 )
				self.ClipMeter:setTopBottom( false, true, -4, 0 )
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
				local f27_local0
				if not WeaponUsesAmmo( controller ) then
					f27_local0 = not IsHeroWeaponGadgetCurrentWeapon( menu, controller )
				else
					f27_local0 = false
				end
				return f27_local0
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
		self.AmmoColorBar:close()
		self.ClipMeter:close()
		CoD.ClipInfoProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

