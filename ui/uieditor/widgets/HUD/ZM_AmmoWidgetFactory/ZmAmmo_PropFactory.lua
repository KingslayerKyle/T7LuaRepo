-- 871bef76873cc807d5640e33002dd116
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_HologramSmallFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_ParticleFX" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_PropSparks" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadIconSide" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadIconMineFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadIconBgmFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadIconBottomFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetStalingrad.ZmAmmo_DpadIconShieldStalingrad" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadIconPistolFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_FlickerLoopFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_GlowLoopFactory" )
require( "ui.uieditor.widgets.onOffImage" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadIconLeftFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadMeterPistolFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadAmmoNumbersFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadLeftAmmoNumberWidgetFactory" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems" )
	Engine.CreateModel( f1_local0, "actionSlot0ammo" )
	Engine.CreateModel( f1_local0, "actionSlot1ammo" )
	Engine.CreateModel( f1_local0, "actionSlot2ammo" )
	Engine.CreateModel( f1_local0, "actionSlot3ammo" )
	Engine.CreateModel( f1_local0, "dpadLeftAmmo" )
	Engine.CreateModel( f1_local0, "showDpadRight_Spider" )
	Engine.CreateModel( f1_local0, "showDpadRight_DragonStrike" )
	Engine.CreateModel( f1_local0, "showDpadRight_Gateworm" )
	Engine.CreateModel( f1_local0, "showDpadRight_Chicken" )
	Engine.CreateModel( f1_local0, "showDpadRight_Drone" )
	Engine.CreateModel( f1_local0, "showDpadLeft_Staff" )
	Engine.CreateModel( f1_local0, "showDpadDown_PES" )
	Engine.CreateModel( f1_local0, "showDpadDown_HackTool" )
	Engine.CreateModel( f1_local0, "showDpadLeft_WaveGun" )
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
	
	local ZmAmmoPropSparks = CoD.ZmAmmo_PropSparks.new( menu, controller )
	ZmAmmoPropSparks:setLeftRight( true, false, 17.81, 160.81 )
	ZmAmmoPropSparks:setTopBottom( true, false, 44.35, 119.35 )
	self:addElement( ZmAmmoPropSparks )
	self.ZmAmmoPropSparks = ZmAmmoPropSparks
	
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
	
	local DpadIconChicken = CoD.ZmAmmo_DpadIconMineFactory.new( menu, controller )
	DpadIconChicken:setLeftRight( true, false, 198, 214 )
	DpadIconChicken:setTopBottom( true, false, 83, 99 )
	DpadIconChicken.IconImgMineDisabled:setImage( RegisterImage( "uie_t7_zm_genesis_hud_ammo_icon_chicken_inactive" ) )
	DpadIconChicken.IconImgMineActive:setImage( RegisterImage( "uie_t7_zm_genesis_hud_ammo_icon_chicken" ) )
	DpadIconChicken:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDpadRight_Chicken", 1 ) and IsModelValueGreaterThan( controller, "hudItems.actionSlot3ammo", 0 )
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
				return IsModelValueEqualTo( controller, "hudItems.showDpadRight_Chicken", 1 )
			end
		}
	} )
	DpadIconChicken:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadRight_Chicken" ), function ( model )
		menu:updateElementState( DpadIconChicken, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadRight_Chicken"
		} )
	end )
	DpadIconChicken:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		menu:updateElementState( DpadIconChicken, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.actionSlot3ammo"
		} )
	end )
	self:addElement( DpadIconChicken )
	self.DpadIconChicken = DpadIconChicken
	
	local DpadIconGateworm = CoD.ZmAmmo_DpadIconMineFactory.new( menu, controller )
	DpadIconGateworm:setLeftRight( true, false, 198, 214 )
	DpadIconGateworm:setTopBottom( true, false, 83, 99 )
	DpadIconGateworm.IconImgMineDisabled:setImage( RegisterImage( "uie_t7_zm_genesis_hud_ammo_icon_gateworm_inactive" ) )
	DpadIconGateworm.IconImgMineActive:setImage( RegisterImage( "uie_t7_zm_genesis_hud_ammo_icon_gateworm" ) )
	DpadIconGateworm:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDpadRight_Gateworm", 1 ) and IsModelValueGreaterThan( controller, "hudItems.actionSlot3ammo", 0 )
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
				return IsModelValueEqualTo( controller, "hudItems.showDpadRight_Gateworm", 1 )
			end
		}
	} )
	DpadIconGateworm:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadRight_Gateworm" ), function ( model )
		menu:updateElementState( DpadIconGateworm, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadRight_Gateworm"
		} )
	end )
	DpadIconGateworm:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		menu:updateElementState( DpadIconGateworm, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.actionSlot3ammo"
		} )
	end )
	self:addElement( DpadIconGateworm )
	self.DpadIconGateworm = DpadIconGateworm
	
	local DpadIconBgm = CoD.ZmAmmo_DpadIconBgmFactory.new( menu, controller )
	DpadIconBgm:setLeftRight( true, false, 168, 184 )
	DpadIconBgm:setTopBottom( true, false, 41, 57 )
	DpadIconBgm:setScale( 0.91 )
	DpadIconBgm:subscribeToGlobalModel( controller, "PerController", "bgb_invalid_use", function ( model )
		PulseElementToStateAndBack( DpadIconBgm, "InvalidUse" )
	end )
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
	
	local DpadIconSpider = CoD.ZmAmmo_DpadIconMineFactory.new( menu, controller )
	DpadIconSpider:setLeftRight( true, false, 198, 214 )
	DpadIconSpider:setTopBottom( true, false, 83, 99 )
	DpadIconSpider:setScale( 0.85 )
	DpadIconSpider.IconImgMineDisabled:setImage( RegisterImage( "uie_t7_zm_island_hud_ammo_icon_spider_inactive" ) )
	DpadIconSpider.IconImgMineActive:setImage( RegisterImage( "uie_t7_zm_island_hud_ammo_icon_spider" ) )
	DpadIconSpider:subscribeToGlobalModel( controller, "PerController", "dragon_strike_invalid_use", function ( model )
		PulseElementToStateAndBack( DpadIconSpider, "InvalidUse" )
	end )
	DpadIconSpider:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDpadRight_Spider", 1 ) and IsModelValueGreaterThan( controller, "hudItems.actionSlot3ammo", 0 )
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
				return IsModelValueEqualTo( controller, "hudItems.showDpadRight_Spider", 1 )
			end
		}
	} )
	DpadIconSpider:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadRight_Spider" ), function ( model )
		menu:updateElementState( DpadIconSpider, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadRight_Spider"
		} )
	end )
	DpadIconSpider:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		menu:updateElementState( DpadIconSpider, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.actionSlot3ammo"
		} )
	end )
	self:addElement( DpadIconSpider )
	self.DpadIconSpider = DpadIconSpider
	
	local DpadIconDragonStrike = CoD.ZmAmmo_DpadIconMineFactory.new( menu, controller )
	DpadIconDragonStrike:setLeftRight( true, false, 198, 214 )
	DpadIconDragonStrike:setTopBottom( true, false, 83, 99 )
	DpadIconDragonStrike:setScale( 0.85 )
	DpadIconDragonStrike.IconImgMineDisabled:setImage( RegisterImage( "uie_t7_icon_inventory_dlc3_dragonstrike_console" ) )
	DpadIconDragonStrike.IconImgMineActive:setImage( RegisterImage( "uie_t7_icon_inventory_dlc3_dragonstrike_console" ) )
	DpadIconDragonStrike:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDpadRight_DragonStrike", 1 ) and IsModelValueGreaterThan( controller, "hudItems.actionSlot3ammo", 0 )
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
				return IsModelValueEqualTo( controller, "hudItems.showDpadRight_DragonStrike", 1 )
			end
		}
	} )
	DpadIconDragonStrike:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadRight_DragonStrike" ), function ( model )
		menu:updateElementState( DpadIconDragonStrike, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadRight_DragonStrike"
		} )
	end )
	DpadIconDragonStrike:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		menu:updateElementState( DpadIconDragonStrike, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.actionSlot3ammo"
		} )
	end )
	self:addElement( DpadIconDragonStrike )
	self.DpadIconDragonStrike = DpadIconDragonStrike
	
	local DpadIconDrone = CoD.ZmAmmo_DpadIconMineFactory.new( menu, controller )
	DpadIconDrone:setLeftRight( true, false, 198, 214 )
	DpadIconDrone:setTopBottom( true, false, 83, 99 )
	DpadIconDrone:setScale( 0.85 )
	DpadIconDrone.IconImgMineDisabled:setImage( RegisterImage( "uie_t7_zm_hd_hud_ammo_icon_drone_inactive" ) )
	DpadIconDrone.IconImgMineActive:setImage( RegisterImage( "uie_t7_zm_hd_hud_ammo_icon_drone_active" ) )
	DpadIconDrone:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDpadRight_Drone", 1 ) and IsModelValueGreaterThan( controller, "hudItems.actionSlot3ammo", 0 )
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
				return IsModelValueEqualTo( controller, "hudItems.showDpadRight_Drone", 1 )
			end
		}
	} )
	DpadIconDrone:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadRight_Drone" ), function ( model )
		menu:updateElementState( DpadIconDrone, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadRight_Drone"
		} )
	end )
	DpadIconDrone:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot3ammo" ), function ( model )
		menu:updateElementState( DpadIconDrone, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.actionSlot3ammo"
		} )
	end )
	self:addElement( DpadIconDrone )
	self.DpadIconDrone = DpadIconDrone
	
	local DpadIconPES = CoD.ZmAmmo_DpadIconBottomFactory.new( menu, controller )
	DpadIconPES:setLeftRight( true, false, 163, 178 )
	DpadIconPES:setTopBottom( true, false, 113, 128 )
	DpadIconPES.IconImgShieldDisabled:setScale( 0.8 )
	DpadIconPES.IconImgShieldActive:setScale( 0.8 )
	DpadIconPES:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDpadDown_PES", 1 )
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
	DpadIconPES:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown_PES" ), function ( model )
		menu:updateElementState( DpadIconPES, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadDown_PES"
		} )
	end )
	self:addElement( DpadIconPES )
	self.DpadIconPES = DpadIconPES
	
	local DpadIconHackTool = CoD.ZmAmmo_DpadIconBottomFactory.new( menu, controller )
	DpadIconHackTool:setLeftRight( true, false, 163, 178 )
	DpadIconHackTool:setTopBottom( true, false, 113, 128 )
	DpadIconHackTool.IconImgShieldDisabled:setScale( 0.8 )
	DpadIconHackTool.IconImgShieldDisabled:setImage( RegisterImage( "uie_t7_zm_hud_ammo_icon_hack" ) )
	DpadIconHackTool.IconImgShieldActive:setScale( 0.8 )
	DpadIconHackTool.IconImgShieldActive:setImage( RegisterImage( "uie_t7_zm_hud_ammo_icon_hack_active" ) )
	DpadIconHackTool:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDpadDown_HackTool", 1 )
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
	DpadIconHackTool:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown_HackTool" ), function ( model )
		menu:updateElementState( DpadIconHackTool, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadDown_HackTool"
		} )
	end )
	self:addElement( DpadIconHackTool )
	self.DpadIconHackTool = DpadIconHackTool
	
	local DpadIconShield = CoD.ZmAmmo_DpadIconShieldStalingrad.new( menu, controller )
	DpadIconShield:setLeftRight( true, false, 163, 178 )
	DpadIconShield:setTopBottom( true, false, 113, 128 )
	DpadIconShield:mergeStateConditions( {
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
	DpadIconShield:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		menu:updateElementState( DpadIconShield, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadDown"
		} )
	end )
	self:addElement( DpadIconShield )
	self.DpadIconShield = DpadIconShield
	
	local DpadIconSword = CoD.ZmAmmo_DpadIconPistolFactory.new( menu, controller )
	DpadIconSword:setLeftRight( true, false, 158.81, 190.81 )
	DpadIconSword:setTopBottom( true, false, 68, 100 )
	self:addElement( DpadIconSword )
	self.DpadIconSword = DpadIconSword
	
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
	
	local DpadLeftCover = CoD.onOffImage.new( menu, controller )
	DpadLeftCover:setLeftRight( true, false, 135.5, 165 )
	DpadLeftCover:setTopBottom( true, false, 46.29, 117.41 )
	DpadLeftCover.image:setImage( RegisterImage( "uie_t7_zm_hd_hud_ammo_cover" ) )
	DpadLeftCover:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsAnyMapName( "zm_tomb", "zm_moon" )
			end
		}
	} )
	self:addElement( DpadLeftCover )
	self.DpadLeftCover = DpadLeftCover
	
	local DpadIconStaff = CoD.ZmAmmo_DpadIconLeftFactory.new( menu, controller )
	DpadIconStaff:setLeftRight( false, false, 17, 33 )
	DpadIconStaff:setTopBottom( false, false, 1, 17 )
	DpadIconStaff.IconImgMineDisabled:setImage( RegisterImage( "uie_t7_zm_hd_hud_ammo_icon_staff_inactive" ) )
	DpadIconStaff.IconImgMineActive:setImage( RegisterImage( "uie_t7_zm_hd_hud_ammo_icon_staff_active" ) )
	DpadIconStaff:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDpadLeft_Staff", 1 ) and IsModelValueGreaterThan( controller, "hudItems.dpadLeftAmmo", 0 )
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
				return IsModelValueEqualTo( controller, "hudItems.showDpadLeft_Staff", 1 )
			end
		}
	} )
	DpadIconStaff:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadLeft_Staff" ), function ( model )
		menu:updateElementState( DpadIconStaff, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadLeft_Staff"
		} )
	end )
	DpadIconStaff:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.dpadLeftAmmo" ), function ( model )
		menu:updateElementState( DpadIconStaff, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.dpadLeftAmmo"
		} )
	end )
	self:addElement( DpadIconStaff )
	self.DpadIconStaff = DpadIconStaff
	
	local DpadIconWaveGun = CoD.ZmAmmo_DpadIconLeftFactory.new( menu, controller )
	DpadIconWaveGun:setLeftRight( false, false, 17, 33 )
	DpadIconWaveGun:setTopBottom( false, false, 1, 17 )
	DpadIconWaveGun.IconImgMineDisabled:setImage( RegisterImage( "uie_t7_zm_hud_ammo_icon_wavegun" ) )
	DpadIconWaveGun.IconImgMineActive:setImage( RegisterImage( "uie_t7_zm_hud_ammo_icon_wavegun_active" ) )
	DpadIconWaveGun:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDpadLeft_WaveGun", 1 ) and IsModelValueGreaterThan( controller, "hudItems.dpadLeftAmmo", 0 )
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
				return IsModelValueEqualTo( controller, "hudItems.showDpadLeft_WaveGun", 1 )
			end
		}
	} )
	DpadIconWaveGun:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadLeft_WaveGun" ), function ( model )
		menu:updateElementState( DpadIconWaveGun, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadLeft_WaveGun"
		} )
	end )
	DpadIconWaveGun:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.dpadLeftAmmo" ), function ( model )
		menu:updateElementState( DpadIconWaveGun, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.dpadLeftAmmo"
		} )
	end )
	self:addElement( DpadIconWaveGun )
	self.DpadIconWaveGun = DpadIconWaveGun
	
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
			stateName = "ShowZ",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
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
	
	local DpadAmmoNumbersBottom = CoD.ZmAmmo_DpadAmmoNumbersFactory.new( menu, controller )
	DpadAmmoNumbersBottom:setLeftRight( true, false, 169, 187 )
	DpadAmmoNumbersBottom:setTopBottom( true, false, 134.7, 152.7 )
	DpadAmmoNumbersBottom:mergeStateConditions( {
		{
			stateName = "ShowZ",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Show5",
			condition = function ( menu, element, event )
				local f73_local0 = IsModelValueEqualTo( controller, "hudItems.actionSlot1ammo", 5 )
				if f73_local0 then
					if not IsMapName( "zm_island" ) and not IsMapName( "zm_tomb" ) then
						f73_local0 = not IsMapName( "zm_moon" )
					else
						f73_local0 = false
					end
				end
				return f73_local0
			end
		},
		{
			stateName = "Show4",
			condition = function ( menu, element, event )
				local f74_local0 = IsModelValueEqualTo( controller, "hudItems.actionSlot1ammo", 4 )
				if f74_local0 then
					if not IsMapName( "zm_island" ) and not IsMapName( "zm_tomb" ) then
						f74_local0 = not IsMapName( "zm_moon" )
					else
						f74_local0 = false
					end
				end
				return f74_local0
			end
		},
		{
			stateName = "Show3",
			condition = function ( menu, element, event )
				local f75_local0 = IsModelValueEqualTo( controller, "hudItems.actionSlot1ammo", 3 )
				if f75_local0 then
					if not IsMapName( "zm_island" ) and not IsMapName( "zm_tomb" ) then
						f75_local0 = not IsMapName( "zm_moon" )
					else
						f75_local0 = false
					end
				end
				return f75_local0
			end
		},
		{
			stateName = "Show2",
			condition = function ( menu, element, event )
				local f76_local0 = IsModelValueEqualTo( controller, "hudItems.actionSlot1ammo", 2 )
				if f76_local0 then
					if not IsMapName( "zm_island" ) and not IsMapName( "zm_tomb" ) then
						f76_local0 = not IsMapName( "zm_moon" )
					else
						f76_local0 = false
					end
				end
				return f76_local0
			end
		},
		{
			stateName = "Show1",
			condition = function ( menu, element, event )
				local f77_local0 = IsModelValueEqualTo( controller, "hudItems.actionSlot1ammo", 1 )
				if f77_local0 then
					if not IsMapName( "zm_island" ) and not IsMapName( "zm_tomb" ) then
						f77_local0 = not IsMapName( "zm_moon" )
					else
						f77_local0 = false
					end
				end
				return f77_local0
			end
		},
		{
			stateName = "Show0",
			condition = function ( menu, element, event )
				local f78_local0 = IsModelValueEqualTo( controller, "hudItems.showDpadDown", 1 )
				if f78_local0 then
					if not IsMapName( "zm_island" ) and not IsMapName( "zm_tomb" ) then
						f78_local0 = not IsMapName( "zm_moon" )
					else
						f78_local0 = false
					end
				end
				return f78_local0
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	DpadAmmoNumbersBottom:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.actionSlot1ammo" ), function ( model )
		menu:updateElementState( DpadAmmoNumbersBottom, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.actionSlot1ammo"
		} )
	end )
	DpadAmmoNumbersBottom:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ), function ( model )
		menu:updateElementState( DpadAmmoNumbersBottom, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDpadDown"
		} )
	end )
	self:addElement( DpadAmmoNumbersBottom )
	self.DpadAmmoNumbersBottom = DpadAmmoNumbersBottom
	
	local DpadAmmoNumbersTop = CoD.ZmAmmo_DpadAmmoNumbersFactory.new( menu, controller )
	DpadAmmoNumbersTop:setLeftRight( true, false, 174.81, 192.81 )
	DpadAmmoNumbersTop:setTopBottom( true, false, 19, 37 )
	DpadAmmoNumbersTop:mergeStateConditions( {
		{
			stateName = "ShowZ",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "bgb_activations_remaining", 7 )
			end
		},
		{
			stateName = "ShowCross",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "bgb_activations_remaining", 6 )
			end
		},
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
	DpadAmmoNumbersTop:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_activations_remaining" ), function ( model )
		menu:updateElementState( DpadAmmoNumbersTop, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb_activations_remaining"
		} )
	end )
	self:addElement( DpadAmmoNumbersTop )
	self.DpadAmmoNumbersTop = DpadAmmoNumbersTop
	
	local DpadIconCounter = CoD.onOffImage.new( menu, controller )
	DpadIconCounter:setLeftRight( true, false, 100.3, 141.5 )
	DpadIconCounter:setTopBottom( true, false, 66.4, 107.6 )
	DpadIconCounter.image:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_dpadbase_left" ) )
	DpadIconCounter:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsAnyMapName( "zm_tomb", "zm_moon" )
			end
		}
	} )
	self:addElement( DpadIconCounter )
	self.DpadIconCounter = DpadIconCounter
	
	local DpadAmmoNumbersLeft = CoD.ZmAmmo_DpadLeftAmmoNumberWidgetFactory.new( menu, controller )
	DpadAmmoNumbersLeft:setLeftRight( true, false, 105.5, 129.5 )
	DpadAmmoNumbersLeft:setTopBottom( true, false, 72, 96 )
	DpadAmmoNumbersLeft:setXRot( 2 )
	DpadAmmoNumbersLeft:setYRot( -20 )
	DpadAmmoNumbersLeft:setScale( 1.1 )
	DpadAmmoNumbersLeft:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsAnyMapName( "zm_tomb", "zm_moon" )
			end
		}
	} )
	self:addElement( DpadAmmoNumbersLeft )
	self.DpadAmmoNumbersLeft = DpadAmmoNumbersLeft
	
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
		element.ZmAmmoPropSparks:close()
		element.DpadIconWpn:close()
		element.DpadIconChicken:close()
		element.DpadIconGateworm:close()
		element.DpadIconBgm:close()
		element.DpadIconMine:close()
		element.DpadIconSpider:close()
		element.DpadIconDragonStrike:close()
		element.DpadIconDrone:close()
		element.DpadIconPES:close()
		element.DpadIconHackTool:close()
		element.DpadIconShield:close()
		element.DpadIconSword:close()
		element.ZmAmmoFlickerLoopFactory:close()
		element.ZmAmmoGlowLoopFactory:close()
		element.DpadLeftCover:close()
		element.DpadIconStaff:close()
		element.DpadIconWaveGun:close()
		element.ZmAmmoDpadMeterPistol:close()
		element.DpadAmmoNumbersRight:close()
		element.DpadAmmoNumbersBottom:close()
		element.DpadAmmoNumbersTop:close()
		element.DpadIconCounter:close()
		element.DpadAmmoNumbersLeft:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

