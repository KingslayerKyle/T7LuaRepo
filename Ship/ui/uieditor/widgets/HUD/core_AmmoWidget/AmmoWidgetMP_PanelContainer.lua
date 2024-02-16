-- f9015fbc082aacb89a244fe55331681a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_PanelEquipContainer" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_PanelCircleContainer" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidgetMP_PanelContainer" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_HeldItemPanel" )

CoD.AmmoWidgetMP_PanelContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_PanelContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_PanelContainer )
	self.id = "AmmoWidgetMP_PanelContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 228 )
	self:setTopBottom( true, false, 0, 106 )
	self.anyChildUsesUpdateState = true
	
	local PanelTactical = CoD.AmmoWidgetMP_PanelEquipContainer.new( menu, controller )
	PanelTactical:setLeftRight( false, false, -74.01, -27.68 )
	PanelTactical:setTopBottom( false, false, -55, -17.67 )
	PanelTactical:setZoom( -10 )
	self:addElement( PanelTactical )
	self.PanelTactical = PanelTactical
	
	local PanelLethal = CoD.AmmoWidgetMP_PanelEquipContainer.new( menu, controller )
	PanelLethal:setLeftRight( false, false, -30.01, 16.33 )
	PanelLethal:setTopBottom( false, false, -55, -17.67 )
	PanelLethal:setZoom( -10 )
	self:addElement( PanelLethal )
	self.PanelLethal = PanelLethal
	
	local PanelOctagon = CoD.AmmoWidgetMP_PanelCircleContainer.new( menu, controller )
	PanelOctagon:setLeftRight( false, false, 15.99, 116.99 )
	PanelOctagon:setTopBottom( false, false, -48, 53 )
	self:addElement( PanelOctagon )
	self.PanelOctagon = PanelOctagon
	
	local PanelAmmo = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	PanelAmmo:setLeftRight( false, false, -81, 57 )
	PanelAmmo:setTopBottom( false, false, -16.67, 29 )
	PanelAmmo:setZoom( -10 )
	PanelAmmo.PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( PanelAmmo )
	self.PanelAmmo = PanelAmmo
	
	local PanelFlagEnemy = CoD.AmmoWidgetMP_HeldItemPanel.new( menu, controller )
	PanelFlagEnemy:setLeftRight( true, false, 6, 52.33 )
	PanelFlagEnemy:setTopBottom( true, false, -2, 35.33 )
	PanelFlagEnemy:setAlpha( 0 )
	PanelFlagEnemy:mergeStateConditions( {
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( PanelFlagEnemy )
	self.PanelFlagEnemy = PanelFlagEnemy
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -114, 35 )
				self.PanelAmmo:setTopBottom( false, false, -16.67, 29 )
				self.clipFinished( PanelAmmo, {} )
			end
		},
		GunDualClip = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -147, -11 )
				self.PanelAmmo:setTopBottom( false, false, -16.67, 29 )
				self.clipFinished( PanelAmmo, {} )
			end
		},
		Gun = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -81, -11 )
				self.PanelAmmo:setTopBottom( false, false, -16.67, 29 )
				self.clipFinished( PanelAmmo, {} )
			end
		},
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -81.34, 57 )
				self.PanelAmmo:setTopBottom( false, false, -16.67, 29 )
				self.clipFinished( PanelAmmo, {} )
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -180, 39 )
				self.PanelAmmo:setTopBottom( false, false, -16.67, 29 )
				self.clipFinished( PanelAmmo, {} )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -114, 57 )
				self.PanelAmmo:setTopBottom( false, false, -16.67, 29 )
				self.clipFinished( PanelAmmo, {} )
			end
		},
		Knife = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -81.34, 47 )
				self.PanelAmmo:setTopBottom( false, false, -16.67, 29 )
				self.clipFinished( PanelAmmo, {} )
			end
		},
		Weapon3Digits = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -127, 39 )
				self.PanelAmmo:setTopBottom( false, false, -16.67, 29 )
				self.clipFinished( PanelAmmo, {} )
			end
		},
		WeaponNoReserve = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -81.34, 57 )
				self.PanelAmmo:setTopBottom( false, false, -16.67, 29 )
				self.clipFinished( PanelAmmo, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "GunDualClip",
			condition = function ( menu, element, event )
				local f12_local0 = IsGameTypeEqualToString( "gun" )
				if f12_local0 then
					f12_local0 = WeaponUsesAmmo( controller )
					if f12_local0 then
						f12_local0 = IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 )
					end
				end
				return f12_local0
			end
		},
		{
			stateName = "Gun",
			condition = function ( menu, element, event )
				local f13_local0 = IsGameTypeEqualToString( "gun" )
				if not f13_local0 then
					f13_local0 = IsGameTypeEqualToString( "prop" )
				end
				return f13_local0
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
			stateName = "Knife",
			condition = function ( menu, element, event )
				local f18_local0
				if not WeaponUsesAmmo( controller ) then
					f18_local0 = not IsHeroWeaponGadgetCurrentWeapon( menu, controller )
				else
					f18_local0 = false
				end
				return f18_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.clipMaxAmmo" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.clipMaxAmmo"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelTactical:close()
		element.PanelLethal:close()
		element.PanelOctagon:close()
		element.PanelAmmo:close()
		element.PanelFlagEnemy:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
