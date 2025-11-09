require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_LowAmmoGlowContainer" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_ClipContainerNew" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_Knife" )
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
	AmmoWidgetMPLowAmmoGlowContainer0:setLeftRight( true, false, 17, 131 )
	AmmoWidgetMPLowAmmoGlowContainer0:setTopBottom( true, false, 16, 50 )
	AmmoWidgetMPLowAmmoGlowContainer0:setRGB( 1, 1, 1 )
	AmmoWidgetMPLowAmmoGlowContainer0:mergeStateConditions( {
		{
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				local f2_local0 = IsLowAmmoClip( controller )
				if f2_local0 then
					f2_local0 = WeaponHasAmmo( controller )
					if f2_local0 then
						f2_local0 = not IsHeroWeaponGadgetCurrentWeapon( menu, controller )
					end
				end
				return f2_local0
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f3_local0
				if not WeaponHasAmmo( controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f3_local0 = WeaponUsesAmmo( controller )
				else
					f3_local0 = false
				end
				return f3_local0
			end
		}
	} )
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
	AmmoWidgetMPLowAmmoGlowContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( AmmoWidgetMPLowAmmoGlowContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:addElement( AmmoWidgetMPLowAmmoGlowContainer0 )
	self.AmmoWidgetMPLowAmmoGlowContainer0 = AmmoWidgetMPLowAmmoGlowContainer0
	
	local Clip = CoD.AmmoWidgetMP_ClipContainerNew.new( menu, controller )
	Clip:setLeftRight( false, true, -160, -35 )
	Clip:setTopBottom( false, true, -64, 14 )
	Clip:setRGB( 1, 1, 1 )
	Clip:setZoom( 3 )
	Clip:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	Clip:setShaderVector( 0, 0, 0, 0, 0 )
	Clip:setShaderVector( 1, 1, 0, 0, 0 )
	Clip:setShaderVector( 2, 10, -3, 0, 0 )
	Clip:setShaderVector( 3, 2.5, 2.5, 0, 0 )
	Clip:setShaderVector( 4, 0, 0, 0, 0 )
	Clip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Clip.Clip.Clip:setText( Engine.Localize( modelValue ) )
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
				local f9_local0
				if not WeaponHasAmmo( controller ) then
					f9_local0 = WeaponUsesAmmo( controller )
				else
					f9_local0 = false
				end
				return f9_local0
			end
		},
		{
			stateName = "Hero",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetCurrentWeapon( menu, controller )
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
	Knife:setShaderVector( 0, 0.1, 0, 0, 0 )
	Knife:setShaderVector( 1, 0, 0, 0, 0 )
	Knife:setShaderVector( 2, 0, 0, 0, 0 )
	Knife:setShaderVector( 3, 0, 0, 0, 0 )
	Knife:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Knife )
	self.Knife = Knife
	
	local TotalAmmo = CoD.AmmoWidgetMP_TotalAmmo.new( menu, controller )
	TotalAmmo:setLeftRight( false, true, -60, -2 )
	TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
	TotalAmmo:setRGB( 1, 1, 1 )
	TotalAmmo:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	TotalAmmo:setShaderVector( 0, 0, 0, 0, 0 )
	TotalAmmo:setShaderVector( 1, 2, 0, 0, 0 )
	TotalAmmo:setShaderVector( 2, 5, -2, 0, 0 )
	TotalAmmo:setShaderVector( 3, 2, 2, 0, 0 )
	TotalAmmo:setShaderVector( 4, 0, 0, 0, 0 )
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
				local f15_local0
				if not WeaponHasAmmo( controller ) then
					f15_local0 = WeaponUsesAmmo( controller )
				else
					f15_local0 = false
				end
				return f15_local0
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
	
	local ClipMeter = CoD.AmmoWidget_ClipMeterColor.new( menu, controller )
	ClipMeter:setLeftRight( false, true, -122.5, -73.5 )
	ClipMeter:setTopBottom( false, true, -7.5, -1.5 )
	ClipMeter:setRGB( 1, 1, 1 )
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
				local f21_local0
				if not WeaponHasAmmo( controller ) then
					f21_local0 = WeaponUsesAmmo( controller )
				else
					f21_local0 = false
				end
				return f21_local0
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
	self:addElement( ClipMeter )
	self.ClipMeter = ClipMeter
	
	local AmmoColorBar = CoD.AmmoWidget_ClipMeterColor.new( menu, controller )
	AmmoColorBar:setLeftRight( true, false, 79, 128 )
	AmmoColorBar:setTopBottom( true, false, 49.5, 55.5 )
	AmmoColorBar:setRGB( 1, 1, 1 )
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
				local f26_local0
				if not WeaponHasAmmo( controller ) then
					f26_local0 = WeaponUsesAmmo( controller )
				else
					f26_local0 = false
				end
				return f26_local0
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
	
	local ClipHero = CoD.AmmoWidgetMP_ClipContainerHero.new( menu, controller )
	ClipHero:setLeftRight( false, true, -106, 19 )
	ClipHero:setTopBottom( false, true, -64, 14 )
	ClipHero:setRGB( 1, 1, 1 )
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
				return IsHeroWeaponGadgetCurrentWeapon( menu, controller )
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
	self:addElement( ClipHero )
	self.ClipHero = ClipHero
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -160, -35 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
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
				self.ClipMeter:setLeftRight( true, false, 12.5, 61.5 )
				self.ClipMeter:setTopBottom( true, false, 49.5, 55.5 )
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
			end
		},
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -106, 19 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				self.clipFinished( Clip, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, 256, 341 )
				self.Knife:setTopBottom( false, true, -38, -12 )
				self.clipFinished( Knife, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -60, -2 )
				self.TotalAmmo:setTopBottom( false, true, -37.5, -7.5 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
				self.ClipMeter:setLeftRight( true, false, 12.5, 61.5 )
				self.ClipMeter:setTopBottom( true, false, 49.5, 55.5 )
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
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -160, -35 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
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
				self.Clip:setLeftRight( false, true, -160, -35 )
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
		Knife = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, 261, 362 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				Knife:completeAnimation()
				self.Knife:setLeftRight( false, true, -89, -4 )
				self.Knife:setTopBottom( false, true, -39, -13 )
				self.clipFinished( Knife, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, 292, 350 )
				self.TotalAmmo:setTopBottom( false, true, -37, -7 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipMeter:completeAnimation()
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
				self:setupElementClipCounter( 6 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -165, -40 )
				self.Clip:setTopBottom( false, true, -64, 14 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
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
				self.ClipMeter:setLeftRight( true, false, 1.5, 64.5 )
				self.ClipMeter:setTopBottom( true, false, 49.5, 55.5 )
				self.clipFinished( ClipMeter, {} )
				AmmoColorBar:completeAnimation()
				self.AmmoColorBar:setLeftRight( false, true, -55.5, -6.5 )
				self.AmmoColorBar:setTopBottom( false, true, -7.5, -1.5 )
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
			stateName = "HeroWeapon",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetCurrentWeapon( menu, controller )
			end
		},
		{
			stateName = "Weapon",
			condition = function ( menu, element, event )
				return WeaponUsesAmmo( controller ) and not IsWeaponClipGreaterThanOrEqualTo( controller, 100 )
			end
		},
		{
			stateName = "Knife",
			condition = function ( menu, element, event )
				return not WeaponUsesAmmo( controller )
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
	self.close = function ( self )
		self.AmmoWidgetMPLowAmmoGlowContainer0:close()
		self.Clip:close()
		self.Knife:close()
		self.TotalAmmo:close()
		self.ClipMeter:close()
		self.AmmoColorBar:close()
		self.ClipHero:close()
		CoD.AmmoWidgetMP_ClipInfo.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

