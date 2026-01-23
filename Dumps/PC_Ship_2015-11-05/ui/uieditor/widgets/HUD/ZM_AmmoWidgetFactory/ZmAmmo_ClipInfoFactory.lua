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
	Clip:setLeftRight( true, false, 0, 108 )
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
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				return IsLowAmmoClip( controller ) and WeaponHasAmmo( controller )
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f4_local0
				if not WeaponHasAmmo( controller ) then
					f4_local0 = WeaponUsesAmmo( controller )
				else
					f4_local0 = false
				end
				return f4_local0
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
				local f10_local0
				if not WeaponHasAmmo( controller ) then
					f10_local0 = WeaponUsesAmmo( controller )
				else
					f10_local0 = false
				end
				return f10_local0
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
	self:addElement( ClipDual )
	self.ClipDual = ClipDual
	
	local ZmFxFlsh = LUI.UIImage.new()
	ZmFxFlsh:setLeftRight( true, false, -4.77, 123.39 )
	ZmFxFlsh:setTopBottom( true, false, -22, 69 )
	ZmFxFlsh:setRGB( 0, 0.42, 1 )
	ZmFxFlsh:setImage( RegisterImage( "uie_t7_zm_hud_rnd_flsh1" ) )
	ZmFxFlsh:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxFlsh )
	self.ZmFxFlsh = ZmFxFlsh
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -135, -27 )
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
				self.Clip:setLeftRight( true, false, 0, 108 )
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
			Sword = function ()
				self:setupElementClipCounter( 4 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, 261, 362 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, 292, 350 )
				self.TotalAmmo:setTopBottom( false, true, -37, -7 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, -6.16, 152 )
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
						ZmFxFlsh:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						ZmFxFlsh:setAlpha( 1 )
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", ZmFxFlshFrame3 )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setLeftRight( true, false, -6.16, 152 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.38 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 4 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( true, false, 21, 129 )
					Clip:setTopBottom( true, false, 0, 48 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 0, 108 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				ClipFrame2( Clip, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
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
				self.Clip:setLeftRight( true, false, 0, 108 )
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
			Sword = function ()
				self:setupElementClipCounter( 4 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, 261, 362 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, 292, 350 )
				self.TotalAmmo:setTopBottom( false, true, -37, -7 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, -25, 159 )
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
				self.ZmFxFlsh:setLeftRight( true, false, -25, 159 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.29 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 3 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( true, false, 21, 129 )
					Clip:setTopBottom( true, false, 0, 48 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 0, 108 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				ClipFrame2( Clip, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 0, 108 )
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
			Sword = function ()
				self:setupElementClipCounter( 4 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, 261, 362 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, 292, 350 )
				self.TotalAmmo:setTopBottom( false, true, -37, -7 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
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
						ZmFxFlsh:setLeftRight( true, false, -24, 168 )
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
				self.ZmFxFlsh:setLeftRight( true, false, -24, 168 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.36 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end,
			Weapon = function ()
				self:setupElementClipCounter( 4 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 0, 108 )
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
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 4 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( true, false, 21, 129 )
					Clip:setTopBottom( true, false, 0, 48 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 0, 108 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				ClipFrame2( Clip, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					if not event.interrupted then
						ZmFxFlsh:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					ZmFxFlsh:setLeftRight( true, false, -35, 59 )
					ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
					ZmFxFlsh:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ZmFxFlsh, event )
					else
						ZmFxFlsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setLeftRight( true, false, -35, 59 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 1 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, -135, -27 )
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
				self.Clip:setLeftRight( true, false, 0, 108 )
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
			Sword = function ()
				self:setupElementClipCounter( 4 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, true, 261, 362 )
				self.Clip:setTopBottom( false, true, -49, -1 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( false, true, 292, 350 )
				self.TotalAmmo:setTopBottom( false, true, -37, -7 )
				self.TotalAmmo:setRGB( 1, 1, 1 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, -25, 159 )
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
				self.ZmFxFlsh:setLeftRight( true, false, -25, 159 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.29 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 3 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( true, false, 21, 129 )
					Clip:setTopBottom( true, false, 0, 48 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 0, 108 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				ClipFrame2( Clip, {} )
				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )
				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
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
				return WeaponUsesAmmo( controller ) and IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 )
			end
		},
		{
			stateName = "Weapon",
			condition = function ( menu, element, event )
				return WeaponUsesAmmo( controller )
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

