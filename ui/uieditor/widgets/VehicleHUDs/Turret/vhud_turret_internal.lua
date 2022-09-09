-- 0086353e3de6260510cca72d4108e72f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Buttons.vhud_generic_button_layout" )
require( "ui.uieditor.widgets.VehicleHUDs.Turret.vhud_turret_reticle" )

CoD.vhud_turret_internal = InheritFrom( LUI.UIElement )
CoD.vhud_turret_internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_turret_internal )
	self.id = "vhud_turret_internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local vignetteCenter = LUI.UIImage.new()
	vignetteCenter:setLeftRight( true, true, -200, 200 )
	vignetteCenter:setTopBottom( true, true, -125, 125 )
	vignetteCenter:setAlpha( 0.5 )
	vignetteCenter:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_backgroundtint" ) )
	self:addElement( vignetteCenter )
	self.vignetteCenter = vignetteCenter
	
	local VignetteContainer = CoD.VehicleGround_VignetteContainer.new( menu, controller )
	VignetteContainer:setLeftRight( true, true, 0, 0 )
	VignetteContainer:setTopBottom( true, true, 0, 0 )
	VignetteContainer:setScale( 1.2 )
	self:addElement( VignetteContainer )
	self.VignetteContainer = VignetteContainer
	
	local buttons = CoD.vhud_generic_button_layout.new( menu, controller )
	buttons:setLeftRight( true, true, 0, 0 )
	buttons:setTopBottom( true, true, 0, 0 )
	buttons:linkToElementModel( self, "bindings", false, function ( model )
		buttons:setModel( model, controller )
	end )
	buttons:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SizeToSafeArea( element, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( buttons )
	self.buttons = buttons
	
	local vhudturretreticle = CoD.vhud_turret_reticle.new( menu, controller )
	vhudturretreticle:setLeftRight( true, true, 0, 0 )
	vhudturretreticle:setTopBottom( true, true, 0, 0 )
	vhudturretreticle:linkToElementModel( self, nil, false, function ( model )
		vhudturretreticle:setModel( model, controller )
	end )
	vhudturretreticle:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		PlayClipOnElement( self, {
			elementName = "vhudturretreticle",
			clipName = "StartUp"
		}, controller )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	vhudturretreticle:mergeStateConditions( {
		{
			stateName = "Zoom",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "zoomed" )
			end
		}
	} )
	vhudturretreticle:linkToElementModel( vhudturretreticle, "zoomed", true, function ( model )
		menu:updateElementState( vhudturretreticle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zoomed"
		} )
	end )
	self:addElement( vhudturretreticle )
	self.vhudturretreticle = vhudturretreticle
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VignetteContainer:close()
		element.buttons:close()
		element.vhudturretreticle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
