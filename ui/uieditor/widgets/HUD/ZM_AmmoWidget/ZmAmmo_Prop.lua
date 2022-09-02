-- b403687407b746b3c274384b1f2ad271
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadIconSide" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadIconBgm" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadIconMine" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadIconShield" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadIconSword" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadMeterSword" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems" )
	Engine.CreateModel( f1_local0, "actionSlot0ammo" )
	Engine.CreateModel( f1_local0, "actionSlot1ammo" )
	Engine.CreateModel( f1_local0, "actionSlot2ammo" )
	Engine.CreateModel( f1_local0, "actionSlot3ammo" )
end

CoD.ZmAmmo_Prop = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_Prop.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_Prop )
	self.id = "ZmAmmo_Prop"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 233 )
	self:setTopBottom( true, false, 0, 144 )
	self.anyChildUsesUpdateState = true
	
	local BulbSmFill = LUI.UIImage.new()
	BulbSmFill:setLeftRight( true, false, 4.31, 172.31 )
	BulbSmFill:setTopBottom( true, false, 34, 122 )
	BulbSmFill:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bulbsmfill" ) )
	self:addElement( BulbSmFill )
	self.BulbSmFill = BulbSmFill
	
	local BulbSmEdge = LUI.UIImage.new()
	BulbSmEdge:setLeftRight( true, false, 4.31, 172.31 )
	BulbSmEdge:setTopBottom( true, false, 34, 122 )
	BulbSmEdge:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bulbsmedge" ) )
	BulbSmEdge:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BulbSmEdge )
	self.BulbSmEdge = BulbSmEdge
	
	local BulbLgFill = LUI.UIImage.new()
	BulbLgFill:setLeftRight( true, false, -39.69, 160.31 )
	BulbLgFill:setTopBottom( true, false, 29, 125 )
	BulbLgFill:setAlpha( 0 )
	BulbLgFill:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bulblrgfill" ) )
	self:addElement( BulbLgFill )
	self.BulbLgFill = BulbLgFill
	
	local BulbLgEdge = LUI.UIImage.new()
	BulbLgEdge:setLeftRight( true, false, -40.69, 159.31 )
	BulbLgEdge:setTopBottom( true, false, 29, 125 )
	BulbLgEdge:setAlpha( 0 )
	BulbLgEdge:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bulblrgedge" ) )
	BulbLgEdge:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BulbLgEdge )
	self.BulbLgEdge = BulbLgEdge
	
	local BulbFlmnt = LUI.UIImage.new()
	BulbFlmnt:setLeftRight( true, false, 9.31, 169.31 )
	BulbFlmnt:setTopBottom( true, false, 37, 125 )
	BulbFlmnt:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bulbflmnt" ) )
	BulbFlmnt:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( BulbFlmnt )
	self.BulbFlmnt = BulbFlmnt
	
	local Glow1 = LUI.UIImage.new()
	Glow1:setLeftRight( true, false, 0, 191 )
	Glow1:setTopBottom( true, false, 28, 122 )
	Glow1:setRGB( 1, 0.31, 0 )
	Glow1:setAlpha( 0.23 )
	Glow1:setZRot( -4 )
	Glow1:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( Glow1 )
	self.Glow1 = Glow1
	
	local DpadElement = LUI.UIImage.new()
	DpadElement:setLeftRight( true, false, 125.96, 252.66 )
	DpadElement:setTopBottom( true, false, 23.65, 150.35 )
	DpadElement:setImage( RegisterImage( "uie_t7_zm_hud_ammo_dpadelement_new" ) )
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
	
	local DpadIconBgm = CoD.ZmAmmo_DpadIconBgm.new( menu, controller )
	DpadIconBgm:setLeftRight( true, false, 171.31, 187.31 )
	DpadIconBgm:setTopBottom( true, false, 41, 57 )
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
	
	local DpadIconMine = CoD.ZmAmmo_DpadIconMine.new( menu, controller )
	DpadIconMine:setLeftRight( true, false, 200.21, 216.21 )
	DpadIconMine:setTopBottom( true, false, 87, 103 )
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
	
	local DpadIconShld = CoD.ZmAmmo_DpadIconShield.new( menu, controller )
	DpadIconShld:setLeftRight( true, false, 166.31, 181.31 )
	DpadIconShld:setTopBottom( true, false, 122, 137 )
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
	
	local DpadIconSword = CoD.ZmAmmo_DpadIconSword.new( menu, controller )
	DpadIconSword:setLeftRight( true, false, 160.31, 192.31 )
	DpadIconSword:setTopBottom( true, false, 72, 104 )
	self:addElement( DpadIconSword )
	self.DpadIconSword = DpadIconSword
	
	local ZmAmmoDpadMeterSword0 = CoD.ZmAmmo_DpadMeterSword.new( menu, controller )
	ZmAmmoDpadMeterSword0:setLeftRight( true, false, 156, 204 )
	ZmAmmoDpadMeterSword0:setTopBottom( true, false, 62, 118 )
	self:addElement( ZmAmmoDpadMeterSword0 )
	self.ZmAmmoDpadMeterSword0 = ZmAmmoDpadMeterSword0
	
	local DpadAmmoNumbersRight = CoD.ZmAmmo_DpadAmmoNumbers.new( menu, controller )
	DpadAmmoNumbersRight:setLeftRight( true, false, 225.31, 243.31 )
	DpadAmmoNumbersRight:setTopBottom( true, false, 85, 103 )
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
	
	local DpadAmmoNumbersTop = CoD.ZmAmmo_DpadAmmoNumbers.new( menu, controller )
	DpadAmmoNumbersTop:setLeftRight( true, false, 171.31, 189.31 )
	DpadAmmoNumbersTop:setTopBottom( true, false, 132.35, 150.35 )
	DpadAmmoNumbersTop:mergeStateConditions( {
		{
			stateName = "ShowZ",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
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
	
	local DpadAmmoNumbersBottom = CoD.ZmAmmo_DpadAmmoNumbers.new( menu, controller )
	DpadAmmoNumbersBottom:setLeftRight( true, false, 172.31, 190.31 )
	DpadAmmoNumbersBottom:setTopBottom( true, false, 25, 43 )
	DpadAmmoNumbersBottom:mergeStateConditions( {
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				BulbSmFill:completeAnimation()
				self.BulbSmFill:setAlpha( 1 )
				self.clipFinished( BulbSmFill, {} )

				BulbSmEdge:completeAnimation()
				self.BulbSmEdge:setAlpha( 1 )
				self.clipFinished( BulbSmEdge, {} )

				BulbLgFill:completeAnimation()
				self.BulbLgFill:setAlpha( 0 )
				self.clipFinished( BulbLgFill, {} )

				BulbLgEdge:completeAnimation()
				self.BulbLgEdge:setAlpha( 0 )
				self.clipFinished( BulbLgEdge, {} )
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				BulbSmFill:completeAnimation()
				self.BulbSmFill:setAlpha( 0 )
				self.clipFinished( BulbSmFill, {} )

				BulbSmEdge:completeAnimation()
				self.BulbSmEdge:setAlpha( 0 )
				self.clipFinished( BulbSmEdge, {} )

				BulbLgFill:completeAnimation()
				self.BulbLgFill:setAlpha( 0.93 )
				self.clipFinished( BulbLgFill, {} )

				BulbLgEdge:completeAnimation()
				self.BulbLgEdge:setAlpha( 1 )
				self.clipFinished( BulbLgEdge, {} )
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
		element.DpadIconWpn:close()
		element.DpadIconBgm:close()
		element.DpadIconMine:close()
		element.DpadIconShld:close()
		element.DpadIconSword:close()
		element.ZmAmmoDpadMeterSword0:close()
		element.DpadAmmoNumbersRight:close()
		element.DpadAmmoNumbersTop:close()
		element.DpadAmmoNumbersBottom:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

