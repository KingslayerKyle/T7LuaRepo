require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_PanelCircle" )

CoD.AmmoWidgetMP_PanelCircleContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_PanelCircleContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_PanelCircleContainer )
	self.id = "AmmoWidgetMP_PanelCircleContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 101 )
	self:setTopBottom( true, false, 0, 101 )
	
	local PanelOctagon = CoD.AmmoWidgetMP_PanelCircle.new( menu, controller )
	PanelOctagon:setLeftRight( false, false, -50.5, 50.5 )
	PanelOctagon:setTopBottom( false, false, -50.5, 50.5 )
	PanelOctagon:setRGB( 1, 1, 1 )
	PanelOctagon:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	PanelOctagon:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( PanelOctagon )
	self.PanelOctagon = PanelOctagon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Weapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Knife = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Weapon3Digits = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Weapon",
			condition = function ( menu, element, event )
				return WeaponUsesAmmo( controller ) and not IsWeaponClipGreaterThanOrEqualTo( controller, 100 )
			end
		},
		{
			stateName = "Knife",
			condition = function ( menu, element, event )
				local f7_local0
				if not WeaponUsesAmmo( controller ) then
					f7_local0 = not IsHeroWeaponGadgetCurrentWeapon( menu, controller )
				else
					f7_local0 = false
				end
				return f7_local0
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
		self.PanelOctagon:close()
		CoD.AmmoWidgetMP_PanelCircleContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

