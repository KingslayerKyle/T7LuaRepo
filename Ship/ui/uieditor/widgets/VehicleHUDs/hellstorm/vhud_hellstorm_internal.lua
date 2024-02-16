-- 9b4a47f2417c585f278fe7efab894234
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_Iris" )
require( "ui.uieditor.widgets.VehicleHUDs.hellstorm.vhud_hellstorm_reticle" )
require( "ui.uieditor.widgets.VehicleHUDs.Buttons.vhud_generic_button_layout" )

CoD.vhud_hellstorm_internal = InheritFrom( LUI.UIElement )
CoD.vhud_hellstorm_internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_hellstorm_internal )
	self.id = "vhud_hellstorm_internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local vignetteCenter = LUI.UIImage.new()
	vignetteCenter:setLeftRight( true, true, -200, 200 )
	vignetteCenter:setTopBottom( true, true, -125, 125 )
	vignetteCenter:setAlpha( 0.6 )
	vignetteCenter:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_backgroundtint" ) )
	self:addElement( vignetteCenter )
	self.vignetteCenter = vignetteCenter
	
	local VehicleGroundIris = CoD.vhud_ms_Iris.new( menu, controller )
	VehicleGroundIris:setLeftRight( false, false, -640, 640 )
	VehicleGroundIris:setTopBottom( false, false, -360, 360 )
	VehicleGroundIris:setRGB( 1, 0.35, 0.35 )
	VehicleGroundIris:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		PlayClipOnElement( self, {
			elementName = "VehicleGroundIris",
			clipName = "StartUp"
		}, controller )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( VehicleGroundIris )
	self.VehicleGroundIris = VehicleGroundIris
	
	local vhudhellstormreticle = CoD.vhud_hellstorm_reticle.new( menu, controller )
	vhudhellstormreticle:setLeftRight( false, false, -640, 640 )
	vhudhellstormreticle:setTopBottom( false, false, -360, 360 )
	vhudhellstormreticle:linkToElementModel( self, nil, false, function ( model )
		vhudhellstormreticle:setModel( model, controller )
	end )
	self:addElement( vhudhellstormreticle )
	self.vhudhellstormreticle = vhudhellstormreticle
	
	local vhudButtonContainer = CoD.vhud_generic_button_layout.new( menu, controller )
	vhudButtonContainer:setLeftRight( true, true, 0, 0 )
	vhudButtonContainer:setTopBottom( true, true, 0, 0 )
	vhudButtonContainer:linkToElementModel( self, "bindings", false, function ( model )
		vhudButtonContainer:setModel( model, controller )
	end )
	self:addElement( vhudButtonContainer )
	self.vhudButtonContainer = vhudButtonContainer
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VehicleGroundIris:close()
		element.vhudhellstormreticle:close()
		element.vhudButtonContainer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
