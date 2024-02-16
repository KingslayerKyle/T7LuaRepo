-- e8eec75597be86f4aee84b4f7aafdb88
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_Clip" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_Total" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_Sword" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_SwordElectric" )

CoD.ZmAmmo_ClipInfo = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_ClipInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_ClipInfo )
	self.id = "ZmAmmo_ClipInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 135 )
	self:setTopBottom( true, false, 0, 57 )
	self.anyChildUsesUpdateState = true
	
	local Clip = CoD.ZmAmmo_Clip.new( menu, controller )
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
	
	local TotalAmmo = CoD.ZmAmmo_Total.new( menu, controller )
	TotalAmmo:setLeftRight( true, false, 57, 165 )
	TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
	self:addElement( TotalAmmo )
	self.TotalAmmo = TotalAmmo
	
	local Sword = CoD.ZmAmmo_Sword.new( menu, controller )
	Sword:setLeftRight( true, false, 364.17, 492.17 )
	Sword:setTopBottom( true, false, 8, 40 )
	self:addElement( Sword )
	self.Sword = Sword
	
	local ZmAmmoSwordElectric = CoD.ZmAmmo_SwordElectric.new( menu, controller )
	ZmAmmoSwordElectric:setLeftRight( true, false, 364.17, 492.17 )
	ZmAmmoSwordElectric:setTopBottom( true, false, 7.5, 39.5 )
	self:addElement( ZmAmmoSwordElectric )
	self.ZmAmmoSwordElectric = ZmAmmoSwordElectric
	
	local ClipDual = CoD.ZmAmmo_Clip.new( menu, controller )
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
	ZmFxFlsh:setAlpha( 0 )
	ZmFxFlsh:setImage( RegisterImage( "uie_t7_zm_hud_rnd_flsh1" ) )
	ZmFxFlsh:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxFlsh )
	self.ZmFxFlsh = ZmFxFlsh
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ZmAmmoSwordElectric:completeAnimation()
				self.ZmAmmoSwordElectric:setLeftRight( true, false, 364.17, 492.17 )
				self.ZmAmmoSwordElectric:setTopBottom( true, false, 7.5, 39.5 )
				self.clipFinished( ZmAmmoSwordElectric, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			WeaponDual = function ()
				self:setupElementClipCounter( 5 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 0, 108 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

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
				self:setupElementClipCounter( 5 )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 6, 134 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

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
				self:setupElementClipCounter( 5 )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end
		},
		ElectricSword = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 363, 491 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ZmAmmoSwordElectric:completeAnimation()
				self.ZmAmmoSwordElectric:setLeftRight( true, false, 7, 135 )
				self.ZmAmmoSwordElectric:setTopBottom( true, false, 7.5, 39.5 )
				self.clipFinished( ZmAmmoSwordElectric, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			WeaponDual = function ()
				self:setupElementClipCounter( 5 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 0, 108 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, -63, 45 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, -74, 159 )
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
				self.ZmFxFlsh:setLeftRight( true, false, -74, 159 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.33 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end,
			Weapon = function ()
				self:setupElementClipCounter( 5 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 0, 108 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, 0, 159 )
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
				self.ZmFxFlsh:setLeftRight( true, false, 0, 159 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.32 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 5 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 21, 129 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 374.17, 482.17 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
						end
						ZmFxFlsh:setLeftRight( true, false, 14, 129 )
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
				self.ZmFxFlsh:setLeftRight( true, false, 14, 129 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.48 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end
		},
		Sword = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 6, 134 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ZmAmmoSwordElectric:completeAnimation()
				self.ZmAmmoSwordElectric:setLeftRight( true, false, 364.17, 492.17 )
				self.ZmAmmoSwordElectric:setTopBottom( true, false, 7.5, 39.5 )
				self.clipFinished( ZmAmmoSwordElectric, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			WeaponDual = function ()
				self:setupElementClipCounter( 5 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 0, 108 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, -63, 45 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, -74, 159 )
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
				self.ZmFxFlsh:setLeftRight( true, false, -74, 159 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.33 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end,
			Weapon = function ()
				self:setupElementClipCounter( 5 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 0, 108 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, 0, 159 )
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
				self.ZmFxFlsh:setLeftRight( true, false, 0, 159 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.32 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 5 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 21, 129 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 374.17, 482.17 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
						end
						ZmFxFlsh:setLeftRight( true, false, 14, 129 )
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
				self.ZmFxFlsh:setLeftRight( true, false, 14, 129 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.48 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end
		},
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 21, 129 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.TotalAmmo:setAlpha( 1 )
				self.clipFinished( TotalAmmo, {} )

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ZmAmmoSwordElectric:completeAnimation()
				self.ZmAmmoSwordElectric:setLeftRight( true, false, 364.17, 492.17 )
				self.ZmAmmoSwordElectric:setTopBottom( true, false, 7.5, 39.5 )
				self.clipFinished( ZmAmmoSwordElectric, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			WeaponDual = function ()
				self:setupElementClipCounter( 5 )

				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( true, false, 0, 108 )
					Clip:setTopBottom( true, false, 0, 48 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 21, 129 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				ClipFrame2( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, -63, 45 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, -63, 37.16 )
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
				self.ZmFxFlsh:setLeftRight( true, false, -63, 37.16 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.28 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end,
			Sword = function ()
				self:setupElementClipCounter( 5 )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 6, 134 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
				local ZmFxFlshFrame2 = function ( ZmFxFlsh, event )
					local ZmFxFlshFrame3 = function ( ZmFxFlsh, event )
						if not event.interrupted then
							ZmFxFlsh:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
						end
						ZmFxFlsh:setLeftRight( true, false, 0, 134 )
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
				self.ZmFxFlsh:setLeftRight( true, false, 0, 134 )
				self.ZmFxFlsh:setTopBottom( true, false, -21.5, 69.5 )
				self.ZmFxFlsh:setAlpha( 0.38 )
				ZmFxFlshFrame2( ZmFxFlsh, {} )
			end,
			Weapon = function ()
				self:setupElementClipCounter( 5 )

				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Clip:setLeftRight( true, false, 0, 108 )
					Clip:setTopBottom( true, false, 0, 48 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 21, 129 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				ClipFrame2( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

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
				self:setupElementClipCounter( 6 )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ZmAmmoSwordElectric:completeAnimation()
				self.ZmAmmoSwordElectric:setLeftRight( true, false, 364.17, 492.17 )
				self.ZmAmmoSwordElectric:setTopBottom( true, false, 7.5, 39.5 )
				self.clipFinished( ZmAmmoSwordElectric, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			WeaponDual = function ()
				self:setupElementClipCounter( 5 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 0, 108 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

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
				self:setupElementClipCounter( 5 )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 6, 134 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ZmAmmoSwordElectric:completeAnimation()
				self.ZmAmmoSwordElectric:setLeftRight( true, false, 364.17, 492.17 )
				self.ZmAmmoSwordElectric:setTopBottom( true, false, 7.5, 39.5 )
				self.clipFinished( ZmAmmoSwordElectric, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, -63, 45 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			Sword = function ()
				self:setupElementClipCounter( 5 )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 6, 134 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

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
				self:setupElementClipCounter( 5 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 0, 108 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

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
				self:setupElementClipCounter( 5 )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

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
				self:setupElementClipCounter( 6 )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ZmAmmoSwordElectric:completeAnimation()
				self.ZmAmmoSwordElectric:setLeftRight( true, false, 364.17, 492.17 )
				self.ZmAmmoSwordElectric:setTopBottom( true, false, 7.5, 39.5 )
				self.clipFinished( ZmAmmoSwordElectric, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )

				ZmFxFlsh:completeAnimation()
				self.ZmFxFlsh:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh, {} )
			end,
			WeaponDual = function ()
				self:setupElementClipCounter( 5 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( true, false, 0, 108 )
				self.Clip:setTopBottom( true, false, 0, 48 )
				self.clipFinished( Clip, {} )

				TotalAmmo:completeAnimation()
				self.TotalAmmo:setLeftRight( true, false, 59, 167 )
				self.TotalAmmo:setTopBottom( true, false, 4.5, 52.5 )
				self.clipFinished( TotalAmmo, {} )

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

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
				self:setupElementClipCounter( 5 )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 6, 134 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

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

				Sword:completeAnimation()
				self.Sword:setLeftRight( true, false, 364.17, 492.17 )
				self.Sword:setTopBottom( true, false, 8, 40 )
				self.clipFinished( Sword, {} )

				ClipDual:completeAnimation()
				self.ClipDual:setLeftRight( true, false, 396, 504 )
				self.ClipDual:setTopBottom( true, false, 0, 48 )
				self.clipFinished( ClipDual, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "ElectricSword",
			condition = function ( menu, element, event )
				local f82_local0 = ModelValueStartsWith( controller, "currentWeapon.viewmodelWeaponName", "glaive_apothicon_" )
				if f82_local0 then
					f82_local0 = IsModelValueGreaterThanOrEqualTo( controller, "zmhud.swordState", 5 )
					if f82_local0 then
						f82_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
					end
				end
				return f82_local0
			end
		},
		{
			stateName = "Sword",
			condition = function ( menu, element, event )
				return ModelValueStartsWith( controller, "currentWeapon.viewmodelWeaponName", "glaive_" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
			end
		},
		{
			stateName = "HeroWeapon",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "currentWeapon.viewmodelWeaponName", "zod_riotshield_zm" )
			end
		},
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.viewmodelWeaponName"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmhud.swordState"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
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
		element.Sword:close()
		element.ZmAmmoSwordElectric:close()
		element.ClipDual:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
