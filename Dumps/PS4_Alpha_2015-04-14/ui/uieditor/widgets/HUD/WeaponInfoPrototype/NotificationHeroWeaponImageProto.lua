require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.HeroWeaponImageProto" )

CoD.NotificationHeroWeaponImageProto = InheritFrom( LUI.UIElement )
CoD.NotificationHeroWeaponImageProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NotificationHeroWeaponImageProto )
	self.id = "NotificationHeroWeaponImageProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 88 )
	self:setTopBottom( true, false, 0, 103 )
	self.anyChildUsesUpdateState = true
	
	local HeroBackgroundImage = LUI.UIImage.new()
	HeroBackgroundImage:setLeftRight( false, true, -88, 0 )
	HeroBackgroundImage:setTopBottom( false, true, -103, -15 )
	HeroBackgroundImage:setRGB( 0.18, 0.18, 0.18 )
	HeroBackgroundImage:setAlpha( 0.6 )
	HeroBackgroundImage:setImage( RegisterImage( "uie_img_t7_hud_cm_herobackingproto" ) )
	HeroBackgroundImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HeroBackgroundImage )
	self.HeroBackgroundImage = HeroBackgroundImage
	
	local HeroWeaponImage = CoD.HeroWeaponImageProto.new( menu, controller )
	HeroWeaponImage:setLeftRight( false, true, -94, 6 )
	HeroWeaponImage:setTopBottom( false, true, -87, -27 )
	HeroWeaponImage:setRGB( 1, 1, 1 )
	HeroWeaponImage:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f2_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f2_local0 = IsHeroWeaponGadgetAvailable( menu, controller )
				else
					f2_local0 = false
				end
				return f2_local0
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and IsHeroWeaponGadgetAvailable( menu, controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetActive( controller ) and not IsHeroWeaponGadgetAmmoEmpty( menu, controller )
			end
		}
	} )
	HeroWeaponImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( HeroWeaponImage, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	HeroWeaponImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( HeroWeaponImage, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	HeroWeaponImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( HeroWeaponImage, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	self:addElement( HeroWeaponImage )
	self.HeroWeaponImage = HeroWeaponImage
	
	local HeroRingBackdrop = LUI.UIImage.new()
	HeroRingBackdrop:setLeftRight( false, true, -88, 0 )
	HeroRingBackdrop:setTopBottom( false, true, -103, -15 )
	HeroRingBackdrop:setRGB( 1, 0.61, 0 )
	HeroRingBackdrop:setImage( RegisterImage( "uie_img_t7_hud_cm_heroringproto" ) )
	HeroRingBackdrop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HeroRingBackdrop )
	self.HeroRingBackdrop = HeroRingBackdrop
	
	self.close = function ( self )
		self.HeroWeaponImage:close()
		CoD.NotificationHeroWeaponImageProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

