-- 1942e7958a97cf8c26e34b8485127142
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_ClipFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_TotalFactory" )

CoD.ZmAmmo_ClipInfoFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_ClipInfoFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_ClipInfoFactory )
	self.id = "ZmAmmo_ClipInfoFactory"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 135 )
	self:setTopBottom( true, false, 0, 57 )
	self.anyChildUsesUpdateState = true
	
	local Clip = CoD.ZmAmmo_ClipFactory.new( menu, controller )
	Clip:setLeftRight( true, false, -12, 96 )
	Clip:setTopBottom( true, false, 0, 48 )
	Clip:setZoom( 3 )
	Clip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )
		if ammoInClip then
			Clip.Clip:setText( Engine.Localize( ammoInClip ) )
		end
	end )
	Clip:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return ModelValueStartsWithAny( controller, "currentWeapon.equippedWeaponReference", "dragon_gauntlet" )
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
				local f5_local0
				if not WeaponHasAmmo( controller ) then
					f5_local0 = WeaponUsesAmmo( controller )
				else
					f5_local0 = false
				end
				return f5_local0
			end
		}
	} )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.equippedWeaponReference"
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
	
	local TotalAmmo = CoD.ZmAmmo_TotalFactory.new( menu, controller )
	TotalAmmo:setLeftRight( true, false, 57, 165 )
	TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
	self:addElement( TotalAmmo )
	self.TotalAmmo = TotalAmmo
	
	local ClipDual = CoD.ZmAmmo_ClipFactory.new( menu, controller )
	ClipDual:setLeftRight( true, false, 396, 504 )
	ClipDual:setTopBottom( true, false, 0, 48 )
	ClipDual:setZoom( 3 )
	ClipDual:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInDWClip", function ( model )
		local ammoInDWClip = Engine.GetModelValue( model )
		if ammoInDWClip then
			ClipDual.Clip:setText( Engine.Localize( ammoInDWClip ) )
		end
	end )
	ClipDual:mergeStateConditions( {
		{
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				return WeaponHasAmmo( controller ) and IsLowAmmoDWClip( controller )
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f12_local0
				if not WeaponHasAmmo( controller ) then
					f12_local0 = WeaponUsesAmmo( controller )
				else
					f12_local0 = false
				end
				return f12_local0
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
	ClipDual:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInClip" ), function ( model )
		menu:updateElementState( ClipDual, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInClip"
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
	ClipDual:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( ClipDual, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	ClipDual:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" ), function ( model )
		menu:updateElementState( ClipDual, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.equippedWeaponReference"
		} )
	end )
	self:addElement( ClipDual )
	self.ClipDual = ClipDual
	
	local ZmFxFlsh = LUI.UIImage.new()
	ZmFxFlsh:setLeftRight( true, false, -4.77, 123.39 )
	ZmFxFlsh:setTopBottom( true, false, -22, 69 )
	ZmFxFlsh:setRGB( 0, 0.42, 1 )
	ZmFxFlsh:setAlpha( 0 )
	ZmFxFlsh:setImage( RegisterImage( "uie_t7_zm_hud_rnd_flsh1" ) )
	ZmFxFlsh:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxFlsh )
	self.ZmFxFlsh = ZmFxFlsh
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -147, -39 )
				self.Clip:setTopBottom( false, true, -57, -9 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -76, 32 )
				self.TotalAmmo:setTopBottom( false, true, -52.5, -4.5 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			WeaponDual = function ()
				self:setupElementClipCounter( 4 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, -5, 103 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 58, 166 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, -63, 45 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, -73.08, 55.08 )
						ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
						ZmFxFlsh:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh, event )
						else
							ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlshFrame3( ZmFxFlsh, event )
						return 
					else
						ZmFxFlsh:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						ZmFxFlsh:setAlpha( 1 )
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", ZmFxFlshFrame3 )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setLeftRight( true, false, -73.08, 55.08 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.38 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end,
			WeaponDualOffsetLeft = function ()
				self:setupElementClipCounter( 4 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, -25, 83 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 38, 146 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, -83, 25 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, -73.08, 55.08 )
						ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
						ZmFxFlsh:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh, event )
						else
							ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlshFrame3( ZmFxFlsh, event )
						return 
					else
						ZmFxFlsh:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						ZmFxFlsh:setLeftRight( true, false, -73.08, 55.08 )
						ZmFxFlsh:setAlpha( 1 )
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", ZmFxFlshFrame3 )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setLeftRight( true, false, -83.08, 45.08 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.38 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end
		},
		WeaponDoesNotUseAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -135, -27 )
				self.Clip:setTopBottom( false, true, -57, -9 )
				self.Clip:setAlpha( 0 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -76, 32 )
				self.TotalAmmo:setTopBottom( false, true, -52.5, -4.5 )
				self.TotalAmmo:setAlpha( 0 )
				self.clipFinished( TotalAmmo, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			WeaponDual = function ()
				self:setupElementClipCounter( 4 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, -2, 106 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, -63, 45 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, -66, 48 )
						ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
						ZmFxFlsh:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh, event )
						else
							ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlshFrame3( ZmFxFlsh, event )
						return 
					else
						ZmFxFlsh:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						ZmFxFlsh:setAlpha( 1 )
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", ZmFxFlshFrame3 )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setLeftRight( true, false, -66, 48 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.37 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end,
			WeaponDualOffsetLeft = function ()
				self:setupElementClipCounter( 4 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, -12, 96 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 49, 157 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, -73, 35 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, -66, 48 )
						ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
						ZmFxFlsh:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh, event )
						else
							ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlshFrame3( ZmFxFlsh, event )
						return 
					else
						ZmFxFlsh:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						ZmFxFlsh:setAlpha( 1 )
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", ZmFxFlshFrame3 )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setLeftRight( true, false, -66, 48 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.37 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, -2, 106 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, -63, 45 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			Weapon = function ()
				self:setupElementClipCounter( 4 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, -12, 96 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
						end
						ZmFxFlsh:setLeftRight( true, false, 4, 168 )
						ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
						ZmFxFlsh:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh, event )
						else
							ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlshFrame3( ZmFxFlsh, event )
						return 
					else
						ZmFxFlsh:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ZmFxFlsh:setAlpha( 1 )
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", ZmFxFlshFrame3 )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setLeftRight( true, false, 4, 168 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.36 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -147, -39 )
				self.Clip:setTopBottom( false, true, -57, -9 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -76, 32 )
				self.TotalAmmo:setTopBottom( false, true, -52.5, -4.5 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			WeaponDual = function ()
				self:setupElementClipCounter( 4 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, -5, 103 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, -63, 45 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, -66, 48 )
						ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
						ZmFxFlsh:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh, event )
						else
							ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlshFrame3( ZmFxFlsh, event )
						return 
					else
						ZmFxFlsh:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						ZmFxFlsh:setAlpha( 1 )
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", ZmFxFlshFrame3 )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setLeftRight( true, false, -66, 48 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.37 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end
		},
		WeaponDualOffsetLeft = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, -22, 86 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 39, 147 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, -83, 25 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setLeftRight( true, false, -14.77, 113.39 )
				self.ZmFxFlsh:setTopBottom( true, false, -22, 69 )
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			WeaponOffsetLeft = function ()
				self:setupElementClipCounter( 4 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, -32, 76 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 39, 147 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
						end
						ZmFxFlsh:setLeftRight( true, false, -6, 158 )
						ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
						ZmFxFlsh:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh, event )
						else
							ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlshFrame3( ZmFxFlsh, event )
						return 
					else
						ZmFxFlsh:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ZmFxFlsh:setAlpha( 1 )
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", ZmFxFlshFrame3 )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setLeftRight( true, false, -6, 158 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.36 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end
		},
		WeaponOffsetLeft = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, -32, 76 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 39, 147 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 386, 494 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setLeftRight( true, false, -14.77, 113.39 )
				self.ZmFxFlsh:setTopBottom( true, false, -22, 69 )
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			WeaponDualOffsetLeft = function ()
				self:setupElementClipCounter( 4 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -160, -52 )
				self.Clip:setTopBottom( false, true, -57, -9 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, -96, 12 )
				self.TotalAmmo:setTopBottom( false, true, -52.5, -4.5 )
				self.clipFinished( TotalAmmo, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, -83, 25 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, -76, 38 )
						ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
						ZmFxFlsh:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ZmFxFlsh, event )
						else
							ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmFxFlshFrame3( ZmFxFlsh, event )
						return 
					else
						ZmFxFlsh:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						ZmFxFlsh:setAlpha( 1 )
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", ZmFxFlshFrame3 )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setLeftRight( true, false, -76, 38 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.37 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "WeaponDoesNotUseAmmo",
			condition = function ( menu, element, event )
				return not WeaponUsesAmmo( controller )
			end
		},
		{
			stateName = "WeaponDual",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 ) and not IsAnyMapName( "zm_tomb", "zm_moon" )
			end
		},
		{
			stateName = "Weapon",
			condition = function ( menu, element, event )
				return not IsAnyMapName( "zm_tomb", "zm_moon" )
			end
		},
		{
			stateName = "WeaponDualOffsetLeft",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 ) and IsAnyMapName( "zm_tomb", "zm_moon" )
			end
		},
		{
			stateName = "WeaponOffsetLeft",
			condition = function ( menu, element, event )
				return IsAnyMapName( "zm_tomb", "zm_moon" )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Clip:close()
		element.TotalAmmo:close()
		element.ClipDual:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

