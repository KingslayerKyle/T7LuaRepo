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
	PanelTactical:setRGB( 1, 1, 1 )
	PanelTactical:setZoom( -10 )
	self:addElement( PanelTactical )
	self.PanelTactical = PanelTactical
	
	local PanelLethal = CoD.AmmoWidgetMP_PanelEquipContainer.new( menu, controller )
	PanelLethal:setLeftRight( false, false, -30.01, 16.33 )
	PanelLethal:setTopBottom( false, false, -55, -17.67 )
	PanelLethal:setRGB( 1, 1, 1 )
	PanelLethal:setZoom( -10 )
	self:addElement( PanelLethal )
	self.PanelLethal = PanelLethal
	
	local PanelOctagon = CoD.AmmoWidgetMP_PanelCircleContainer.new( menu, controller )
	PanelOctagon:setLeftRight( false, false, 15.99, 116.99 )
	PanelOctagon:setTopBottom( false, false, -48, 53 )
	PanelOctagon:setRGB( 1, 1, 1 )
	self:addElement( PanelOctagon )
	self.PanelOctagon = PanelOctagon
	
	local PanelAmmo = CoD.DamageWidgetMP_PanelContainer.new( menu, controller )
	PanelAmmo:setLeftRight( false, false, -81, 57 )
	PanelAmmo:setTopBottom( false, false, -16.67, 29 )
	PanelAmmo:setRGB( 1, 1, 1 )
	PanelAmmo:setZoom( -10 )
	PanelAmmo.PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( PanelAmmo )
	self.PanelAmmo = PanelAmmo
	
	local PanelFlagEnemy = CoD.AmmoWidgetMP_HeldItemPanel.new( menu, controller )
	PanelFlagEnemy:setLeftRight( true, false, 6, 52.33 )
	PanelFlagEnemy:setTopBottom( true, false, -2, 35.33 )
	PanelFlagEnemy:setRGB( 1, 1, 1 )
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
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -81, 57 )
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
				local f9_local0
				if not WeaponUsesAmmo( controller ) then
					f9_local0 = not IsHeroWeaponGadgetCurrentWeapon( menu, controller )
				else
					f9_local0 = false
				end
				return f9_local0
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
		self.PanelTactical:close()
		self.PanelLethal:close()
		self.PanelOctagon:close()
		self.PanelAmmo:close()
		self.PanelFlagEnemy:close()
		CoD.AmmoWidgetMP_PanelContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

