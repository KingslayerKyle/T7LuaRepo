require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_HologramSmallFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_ParticleFX" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadIconSide" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadIconBgmFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadIconMineFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadIconShieldFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadIconPistolFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadMeterPistolFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadAmmoNumbersFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_FlickerLoopFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_GlowLoopFactory" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems" )
	Engine.CreateModel( f1_local0, "actionSlot0ammo" )
	Engine.CreateModel( f1_local0, "actionSlot1ammo" )
	Engine.CreateModel( f1_local0, "actionSlot2ammo" )
	Engine.CreateModel( f1_local0, "actionSlot3ammo" )
end

CoD.ZmAmmo_PropFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_PropFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_PropFactory )
	self.id = "ZmAmmo_PropFactory"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 233 )
	self:setTopBottom( true, false, 0, 144 )
	self.anyChildUsesUpdateState = true
	
	local ZmAmmoHologramSmallFactory = CoD.ZmAmmo_HologramSmallFactory.new( menu, controller )
	ZmAmmoHologramSmallFactory:setLeftRight( true, false, -10.87, 258.45 )
	ZmAmmoHologramSmallFactory:setTopBottom( true, false, -25.27, 183.92 )
	self:addElement( ZmAmmoHologramSmallFactory )
	self.ZmAmmoHologramSmallFactory = ZmAmmoHologramSmallFactory
	
	local BulbLgFill = LUI.UIImage.new()
	BulbLgFill:setLeftRight( true, false, -13.57, 261.15 )
	BulbLgFill:setTopBottom( true, false, -26.27, 185.05 )
	BulbLgFill:setAlpha( 0 )
	BulbLgFill:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_projection_lrg" ) )
	self:addElement( BulbLgFill )
	self.BulbLgFill = BulbLgFill
	
	local ZmAmmoParticleFX = CoD.ZmAmmo_ParticleFX.new( menu, controller )
	ZmAmmoParticleFX:setLeftRight( true, false, 31.33, 174.81 )
	ZmAmmoParticleFX:setTopBottom( true, false, 42.09, 116.7 )
	ZmAmmoParticleFX:setXRot( 1 )
	ZmAmmoParticleFX:setYRot( 1 )
	ZmAmmoParticleFX:setZRot( -10 )
	ZmAmmoParticleFX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX.p2:setAlpha( 0 )
	ZmAmmoParticleFX.p3:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX )
	self.ZmAmmoParticleFX = ZmAmmoParticleFX
	
	local ZmAmmoParticleFX2 = CoD.ZmAmmo_ParticleFX.new( menu, controller )
	ZmAmmoParticleFX2:setLeftRight( true, false, 31.33, 174.81 )
	ZmAmmoParticleFX2:setTopBottom( true, false, 39.7, 114.3 )
	ZmAmmoParticleFX2:setZRot( -10 )
	ZmAmmoParticleFX2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX2.p1:setAlpha( 0 )
	ZmAmmoParticleFX2.p3:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX2 )
	self.ZmAmmoParticleFX2 = ZmAmmoParticleFX2
	
	local ZmAmmoParticleFX3 = CoD.ZmAmmo_ParticleFX.new( menu, controller )
	ZmAmmoParticleFX3:setLeftRight( true, false, 31.33, 174.81 )
	ZmAmmoParticleFX3:setTopBottom( true, false, 40.7, 115.3 )
	ZmAmmoParticleFX3:setZRot( -10 )
	ZmAmmoParticleFX3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX3.p1:setAlpha( 0 )
	ZmAmmoParticleFX3.p2:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX3 )
	self.ZmAmmoParticleFX3 = ZmAmmoParticleFX3
	
	local DpadElement = LUI.UIImage.new()
	DpadElement:setLeftRight( true, false, 122.96, 249.66 )
	DpadElement:setTopBottom( true, false, 11, 152.7 )
	DpadElement:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_dpadbase" ) )
	self:addElement( DpadElement )
	self.DpadElement = DpadElement
	
	local DpadIconWpn = CoD.ZmAmmo_DpadIconSide.new( menu, controller )
	DpadIconWpn:setLeftRight( true, false, 140, 156 )
	DpadIconWpn:setTopBottom( true, false, 76, 92 )
	DpadIconWpn:setAlpha( 0 )
	DpadIconWpn:mergeStateConditions( {
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( DpadIconWpn )
	self.DpadIconWpn = DpadIconWpn
	
	local DpadIconBgm = CoD.ZmAmmo_DpadIconBgmFactory.new( menu, controller )
	DpadIconBgm:setLeftRight( true, false, 168, 184 )
	DpadIconBgm:setTopBottom( true, false, 41, 57 )
	DpadIconBgm:setScale( 0.91 )
	DpadIconBgm:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "bgb_activations_remaining", 0 )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDpadUp", 1 )
			end
		}
	} )
	DpadIconBgm:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_activations_remaining" ), function ( model )
		menu:updateElementState( DpadIconBgm, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb_activations_remaining"
		} )
	end )
	DpadIconBgm:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadUp" ), function ( model )
		menu:updateElementState( DpadIconBgm, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadUp"
		} )
	end )
	self:addElement( DpadIconBgm )
	self.DpadIconBgm = DpadIconBgm
	
	local DpadIconMine = CoD.ZmAmmo_DpadIconMineFactory.new( menu, controller )
	DpadIconMine:setLeftRight( true, false, 198, 214 )
	DpadIconMine:setTopBottom( true, false, 83, 99 )
	DpadIconMine:setScale( 0.85 )
	DpadIconMine:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDpadRight", 1 ) and IsModelValueGreaterThan( controller, "hudItems.actionSlot3ammo", 0 )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDpadRight", 1 )
			end
		}
	} )
	DpadIconMine:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadRight" ), function ( model )
		menu:updateElementState( DpadIconMine, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadRight"
		} )
	end )
	DpadIconMine:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		menu:updateElementState( DpadIconMine, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.actionSlot3ammo"
		} )
	end )
	self:addElement( DpadIconMine )
	self.DpadIconMine = DpadIconMine
	
	local DpadIconShld = CoD.ZmAmmo_DpadIconShieldFactory.new( menu, controller )
	DpadIconShld:setLeftRight( true, false, 163, 178 )
	DpadIconShld:setTopBottom( true, false, 113, 128 )
	DpadIconShld:setScale( 0.88 )
	DpadIconShld:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDpadDown", 1 )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	DpadIconShld:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		menu:updateElementState( DpadIconShld, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadDown"
		} )
	end )
	self:addElement( DpadIconShld )
	self.DpadIconShld = DpadIconShld
	
	local DpadIconSword = CoD.ZmAmmo_DpadIconPistolFactory.new( menu, controller )
	DpadIconSword:setLeftRight( true, false, 158.81, 190.81 )
	DpadIconSword:setTopBottom( true, false, 68, 100 )
	self:addElement( DpadIconSword )
	self.DpadIconSword = DpadIconSword
	
	local ZmAmmoDpadMeterPistol = CoD.ZmAmmo_DpadMeterPistolFactory.new( menu, controller )
	ZmAmmoDpadMeterPistol:setLeftRight( true, false, 154, 202 )
	ZmAmmoDpadMeterPistol:setTopBottom( true, false, 58, 114 )
	ZmAmmoDpadMeterPistol:setScale( 0.95 )
	self:addElement( ZmAmmoDpadMeterPistol )
	self.ZmAmmoDpadMeterPistol = ZmAmmoDpadMeterPistol
	
	local DpadAmmoNumbersRight = CoD.ZmAmmo_DpadAmmoNumbersFactory.new( menu, controller )
	DpadAmmoNumbersRight:setLeftRight( true, false, 223, 241 )
	DpadAmmoNumbersRight:setTopBottom( true, false, 82, 100 )
	DpadAmmoNumbersRight:mergeStateConditions( {
		{
			stateName = "Show5",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.actionSlot3ammo", 5 )
			end
		},
		{
			stateName = "Show4",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.actionSlot3ammo", 4 )
			end
		},
		{
			stateName = "Show3",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.actionSlot3ammo", 3 )
			end
		},
		{
			stateName = "Show2",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.actionSlot3ammo", 2 )
			end
		},
		{
			stateName = "Show1",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.actionSlot3ammo", 1 )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	DpadAmmoNumbersRight:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		menu:updateElementState( DpadAmmoNumbersRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.actionSlot3ammo"
		} )
	end )
	self:addElement( DpadAmmoNumbersRight )
	self.DpadAmmoNumbersRight = DpadAmmoNumbersRight
	
	local DpadAmmoNumbersTop = CoD.ZmAmmo_DpadAmmoNumbersFactory.new( menu, controller )
	DpadAmmoNumbersTop:setLeftRight( true, false, 169, 187 )
	DpadAmmoNumbersTop:setTopBottom( true, false, 134.7, 152.7 )
	DpadAmmoNumbersTop:mergeStateConditions( {
		{
			stateName = "Show5",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.actionSlot1ammo", 5 )
			end
		},
		{
			stateName = "Show4",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.actionSlot1ammo", 4 )
			end
		},
		{
			stateName = "Show3",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.actionSlot1ammo", 3 )
			end
		},
		{
			stateName = "Show2",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.actionSlot1ammo", 2 )
			end
		},
		{
			stateName = "Show1",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.actionSlot1ammo", 1 )
			end
		},
		{
			stateName = "Show0",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDpadDown", 1 )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	DpadAmmoNumbersTop:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot1ammo" ), function ( model )
		menu:updateElementState( DpadAmmoNumbersTop, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.actionSlot1ammo"
		} )
	end )
	DpadAmmoNumbersTop:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		menu:updateElementState( DpadAmmoNumbersTop, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadDown"
		} )
	end )
	self:addElement( DpadAmmoNumbersTop )
	self.DpadAmmoNumbersTop = DpadAmmoNumbersTop
	
	local DpadAmmoNumbersBottom = CoD.ZmAmmo_DpadAmmoNumbersFactory.new( menu, controller )
	DpadAmmoNumbersBottom:setLeftRight( true, false, 174.81, 192.81 )
	DpadAmmoNumbersBottom:setTopBottom( true, false, 19, 37 )
	DpadAmmoNumbersBottom:mergeStateConditions( {
		{
			stateName = "Show5",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "bgb_activations_remaining", 5 )
			end
		},
		{
			stateName = "Show4",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "bgb_activations_remaining", 4 )
			end
		},
		{
			stateName = "Show3",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "bgb_activations_remaining", 3 )
			end
		},
		{
			stateName = "Show2",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "bgb_activations_remaining", 2 )
			end
		},
		{
			stateName = "Show1",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "bgb_activations_remaining", 1 )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	DpadAmmoNumbersBottom:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_activations_remaining" ), function ( model )
		menu:updateElementState( DpadAmmoNumbersBottom, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb_activations_remaining"
		} )
	end )
	self:addElement( DpadAmmoNumbersBottom )
	self.DpadAmmoNumbersBottom = DpadAmmoNumbersBottom
	
	local ZmAmmoFlickerLoopFactory = CoD.ZmAmmo_FlickerLoopFactory.new( menu, controller )
	ZmAmmoFlickerLoopFactory:setLeftRight( true, false, 122.58, 249.42 )
	ZmAmmoFlickerLoopFactory:setTopBottom( true, false, 26, 152.85 )
	self:addElement( ZmAmmoFlickerLoopFactory )
	self.ZmAmmoFlickerLoopFactory = ZmAmmoFlickerLoopFactory
	
	local ZmAmmoGlowLoopFactory = CoD.ZmAmmo_GlowLoopFactory.new( menu, controller )
	ZmAmmoGlowLoopFactory:setLeftRight( true, false, 119, 179 )
	ZmAmmoGlowLoopFactory:setTopBottom( true, false, 65.39, 125.39 )
	ZmAmmoGlowLoopFactory:setScale( 0.8 )
	self:addElement( ZmAmmoGlowLoopFactory )
	self.ZmAmmoGlowLoopFactory = ZmAmmoGlowLoopFactory
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BulbLgFill:completeAnimation()
				self.BulbLgFill:setAlpha( 0 )
				self.clipFinished( BulbLgFill, {} )
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BulbLgFill:completeAnimation()
				self.BulbLgFill:setAlpha( 0.93 )
				self.clipFinished( BulbLgFill, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "WeaponDual",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInDWClip" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInDWClip"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmAmmoHologramSmallFactory:close()
		element.ZmAmmoParticleFX:close()
		element.ZmAmmoParticleFX2:close()
		element.ZmAmmoParticleFX3:close()
		element.DpadIconWpn:close()
		element.DpadIconBgm:close()
		element.DpadIconMine:close()
		element.DpadIconShld:close()
		element.DpadIconSword:close()
		element.ZmAmmoDpadMeterPistol:close()
		element.DpadAmmoNumbersRight:close()
		element.DpadAmmoNumbersTop:close()
		element.DpadAmmoNumbersBottom:close()
		element.ZmAmmoFlickerLoopFactory:close()
		element.ZmAmmoGlowLoopFactory:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

