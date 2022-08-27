-- c10a64690e1db474eea80c250b00aa56
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_LowAmmoGlow" )

CoD.AmmoWidgetMP_LowAmmoGlowContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_LowAmmoGlowContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_LowAmmoGlowContainer )
	self.id = "AmmoWidgetMP_LowAmmoGlowContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 114 )
	self:setTopBottom( true, false, 0, 34 )
	self.anyChildUsesUpdateState = true
	
	local LowAmmoClip = CoD.AmmoWidgetMP_LowAmmoGlow.new( menu, controller )
	LowAmmoClip:setLeftRight( true, false, 0, 46 )
	LowAmmoClip:setTopBottom( true, false, 0, 34 )
	LowAmmoClip:setRGB( 0.4, 0, 0 )
	LowAmmoClip:setAlpha( 0.7 )
	LowAmmoClip:setZoom( -10 )
	LowAmmoClip:mergeStateConditions( {
		{
			stateName = "Hero",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetCurrentWeapon( menu, controller )
			end
		},
		{
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				local f3_local0 = IsLowAmmoClip( controller )
				if f3_local0 then
					f3_local0 = WeaponHasAmmo( controller )
					if f3_local0 then
						f3_local0 = not IsCurrentViewmodelWeaponGamemodeHiddenAmmo( controller )
					end
				end
				return f3_local0
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f4_local0
				if not WeaponHasAmmo( controller ) then
					f4_local0 = WeaponUsesAmmo( controller )
					if f4_local0 then
						f4_local0 = not IsCurrentViewmodelWeaponGamemodeHiddenAmmo( controller )
					end
				else
					f4_local0 = false
				end
				return f4_local0
			end
		},
		{
			stateName = "Knife",
			condition = function ( menu, element, event )
				local f5_local0
				if not WeaponUsesAmmo( controller ) then
					f5_local0 = not IsHeroWeaponGadgetCurrentWeapon( menu, controller )
				else
					f5_local0 = false
				end
				return f5_local0
			end
		}
	} )
	LowAmmoClip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( LowAmmoClip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	LowAmmoClip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ), function ( model )
		menu:updateElementState( LowAmmoClip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoStock"
		} )
	end )
	LowAmmoClip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInClip" ), function ( model )
		menu:updateElementState( LowAmmoClip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInClip"
		} )
	end )
	LowAmmoClip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
		menu:updateElementState( LowAmmoClip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.viewmodelWeaponName"
		} )
	end )
	LowAmmoClip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( LowAmmoClip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	LowAmmoClip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" ), function ( model )
		menu:updateElementState( LowAmmoClip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.equippedWeaponReference"
		} )
	end )
	self:addElement( LowAmmoClip )
	self.LowAmmoClip = LowAmmoClip
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setLeftRight( true, false, 0, 46 )
				self.LowAmmoClip:setTopBottom( true, false, 0, 34 )
				self.clipFinished( LowAmmoClip, {} )
			end,
			NoAmmo = function ()
				self:setupElementClipCounter( 1 )
				local LowAmmoClipFrame2 = function ( LowAmmoClip, event )
					if not event.interrupted then
						LowAmmoClip:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
					end
					LowAmmoClip:setLeftRight( true, false, 0, 114 )
					LowAmmoClip:setTopBottom( true, false, 0, 34 )
					if event.interrupted then
						self.clipFinished( LowAmmoClip, event )
					else
						LowAmmoClip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setLeftRight( true, false, 0, 46 )
				self.LowAmmoClip:setTopBottom( true, false, 0, 34 )
				LowAmmoClipFrame2( LowAmmoClip, {} )
			end
		},
		Hero = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setLeftRight( true, false, 0, 46 )
				self.LowAmmoClip:setTopBottom( true, false, 0, 34 )
				self.clipFinished( LowAmmoClip, {} )
			end,
			NoAmmo = function ()
				self:setupElementClipCounter( 1 )
				local LowAmmoClipFrame2 = function ( LowAmmoClip, event )
					local LowAmmoClipFrame3 = function ( LowAmmoClip, event )
						if not event.interrupted then
							LowAmmoClip:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
						end
						LowAmmoClip:setAlpha( 0.7 )
						if event.interrupted then
							self.clipFinished( LowAmmoClip, event )
						else
							LowAmmoClip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LowAmmoClipFrame3( LowAmmoClip, event )
						return 
					else
						LowAmmoClip:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
						LowAmmoClip:registerEventHandler( "transition_complete_keyframe", LowAmmoClipFrame3 )
					end
				end
				
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setAlpha( 0 )
				LowAmmoClipFrame2( LowAmmoClip, {} )
			end,
			LowAmmo = function ()
				self:setupElementClipCounter( 1 )
				local LowAmmoClipFrame2 = function ( LowAmmoClip, event )
					local LowAmmoClipFrame3 = function ( LowAmmoClip, event )
						if not event.interrupted then
							LowAmmoClip:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
						end
						LowAmmoClip:setAlpha( 0.7 )
						if event.interrupted then
							self.clipFinished( LowAmmoClip, event )
						else
							LowAmmoClip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LowAmmoClipFrame3( LowAmmoClip, event )
						return 
					else
						LowAmmoClip:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
						LowAmmoClip:registerEventHandler( "transition_complete_keyframe", LowAmmoClipFrame3 )
					end
				end
				
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setAlpha( 0 )
				LowAmmoClipFrame2( LowAmmoClip, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local LowAmmoClipFrame2 = function ( LowAmmoClip, event )
					local LowAmmoClipFrame3 = function ( LowAmmoClip, event )
						if not event.interrupted then
							LowAmmoClip:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
						end
						LowAmmoClip:setAlpha( 0.7 )
						if event.interrupted then
							self.clipFinished( LowAmmoClip, event )
						else
							LowAmmoClip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LowAmmoClipFrame3( LowAmmoClip, event )
						return 
					else
						LowAmmoClip:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
						LowAmmoClip:registerEventHandler( "transition_complete_keyframe", LowAmmoClipFrame3 )
					end
				end
				
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setAlpha( 0 )
				LowAmmoClipFrame2( LowAmmoClip, {} )
			end
		},
		LowAmmoNoReserve = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setLeftRight( true, false, 36, 114 )
				self.LowAmmoClip:setTopBottom( true, false, 0, 34 )
				self.clipFinished( LowAmmoClip, {} )
			end
		},
		NoAmmoNoReserve = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setLeftRight( true, false, 36, 114 )
				self.LowAmmoClip:setTopBottom( true, false, 0, 34 )
				self.clipFinished( LowAmmoClip, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local LowAmmoClipFrame2 = function ( LowAmmoClip, event )
					if not event.interrupted then
						LowAmmoClip:beginAnimation( "keyframe", 589, true, true, CoD.TweenType.Linear )
					end
					LowAmmoClip:setLeftRight( true, false, 0, 46 )
					LowAmmoClip:setTopBottom( true, false, 0, 34 )
					if event.interrupted then
						self.clipFinished( LowAmmoClip, event )
					else
						LowAmmoClip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setLeftRight( true, false, 36, 114 )
				self.LowAmmoClip:setTopBottom( true, false, 0, 34 )
				LowAmmoClipFrame2( LowAmmoClip, {} )
			end
		},
		LowAmmoDW = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setLeftRight( true, false, -74, 46 )
				self.LowAmmoClip:setTopBottom( true, false, 0, 34 )
				self.clipFinished( LowAmmoClip, {} )
			end,
			NoAmmoDW = function ()
				self:setupElementClipCounter( 1 )
				local LowAmmoClipFrame2 = function ( LowAmmoClip, event )
					if not event.interrupted then
						LowAmmoClip:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
					end
					LowAmmoClip:setLeftRight( true, false, -74, 114 )
					LowAmmoClip:setTopBottom( true, false, 0, 34 )
					if event.interrupted then
						self.clipFinished( LowAmmoClip, event )
					else
						LowAmmoClip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setLeftRight( true, false, -74, 46 )
				self.LowAmmoClip:setTopBottom( true, false, 0, 34 )
				LowAmmoClipFrame2( LowAmmoClip, {} )
			end
		},
		NoAmmoDW = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setLeftRight( true, false, -74, 114 )
				self.LowAmmoClip:setTopBottom( true, false, 0, 34 )
				self.clipFinished( LowAmmoClip, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local LowAmmoClipFrame2 = function ( LowAmmoClip, event )
					if not event.interrupted then
						LowAmmoClip:beginAnimation( "keyframe", 589, true, true, CoD.TweenType.Linear )
					end
					LowAmmoClip:setLeftRight( true, false, 0, 46 )
					LowAmmoClip:setTopBottom( true, false, 0, 34 )
					if event.interrupted then
						self.clipFinished( LowAmmoClip, event )
					else
						LowAmmoClip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setLeftRight( true, false, -74, 114 )
				self.LowAmmoClip:setTopBottom( true, false, 0, 34 )
				LowAmmoClipFrame2( LowAmmoClip, {} )
			end
		},
		LowAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setLeftRight( true, false, 0, 46 )
				self.LowAmmoClip:setTopBottom( true, false, 0, 34 )
				self.clipFinished( LowAmmoClip, {} )
			end,
			NoAmmo = function ()
				self:setupElementClipCounter( 1 )
				local LowAmmoClipFrame2 = function ( LowAmmoClip, event )
					if not event.interrupted then
						LowAmmoClip:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
					end
					LowAmmoClip:setLeftRight( true, false, 0, 114 )
					LowAmmoClip:setTopBottom( true, false, 0, 34 )
					if event.interrupted then
						self.clipFinished( LowAmmoClip, event )
					else
						LowAmmoClip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setLeftRight( true, false, 0, 46 )
				self.LowAmmoClip:setTopBottom( true, false, 0, 34 )
				LowAmmoClipFrame2( LowAmmoClip, {} )
			end
		},
		NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setLeftRight( true, false, 0, 114 )
				self.LowAmmoClip:setTopBottom( true, false, 0, 34 )
				self.clipFinished( LowAmmoClip, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local LowAmmoClipFrame2 = function ( LowAmmoClip, event )
					if not event.interrupted then
						LowAmmoClip:beginAnimation( "keyframe", 589, true, true, CoD.TweenType.Linear )
					end
					LowAmmoClip:setLeftRight( true, false, 0, 46 )
					LowAmmoClip:setTopBottom( true, false, 0, 34 )
					if event.interrupted then
						self.clipFinished( LowAmmoClip, event )
					else
						LowAmmoClip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LowAmmoClip:completeAnimation()
				self.LowAmmoClip:setLeftRight( true, false, 0, 114 )
				self.LowAmmoClip:setTopBottom( true, false, 0, 34 )
				LowAmmoClipFrame2( LowAmmoClip, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LowAmmoClip:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

