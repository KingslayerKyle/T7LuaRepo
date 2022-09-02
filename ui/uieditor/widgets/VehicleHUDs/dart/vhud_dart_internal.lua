-- bb028192886e92a690858a79d5ca124c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_reticle" )
require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_Iris" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Buttons.vhud_generic_button_layout" )
require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_Timebar" )

CoD.vhud_dart_internal = InheritFrom( LUI.UIElement )
CoD.vhud_dart_internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_dart_internal )
	self.id = "vhud_dart_internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local vignetteCenter = LUI.UIImage.new()
	vignetteCenter:setLeftRight( true, true, -202.5, 202.5 )
	vignetteCenter:setTopBottom( true, true, -117.91, 109.91 )
	vignetteCenter:setAlpha( 0.1 )
	vignetteCenter:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_backgroundtint" ) )
	self:addElement( vignetteCenter )
	self.vignetteCenter = vignetteCenter
	
	local vhuddartreticle = CoD.vhud_dart_reticle.new( menu, controller )
	vhuddartreticle:setLeftRight( true, true, -15.83, 15.83 )
	vhuddartreticle:setTopBottom( true, true, 0, 0 )
	vhuddartreticle:linkToElementModel( self, nil, false, function ( model )
		vhuddartreticle:setModel( model, controller )
	end )
	self:addElement( vhuddartreticle )
	self.vhuddartreticle = vhuddartreticle
	
	local vhuddartIris = CoD.vhud_dart_Iris.new( menu, controller )
	vhuddartIris:setLeftRight( true, true, 0, 0 )
	vhuddartIris:setTopBottom( true, true, 0, 0 )
	vhuddartIris:setRGB( 0.95, 0.87, 0.34 )
	vhuddartIris:setScale( 0.9 )
	self:addElement( vhuddartIris )
	self.vhuddartIris = vhuddartIris
	
	local VignetteContainer = CoD.VehicleGround_VignetteContainer.new( menu, controller )
	VignetteContainer:setLeftRight( true, true, 0, 0 )
	VignetteContainer:setTopBottom( true, true, 0, 0 )
	VignetteContainer:setAlpha( 0.5 )
	self:addElement( VignetteContainer )
	self.VignetteContainer = VignetteContainer
	
	local vhudmsButtonContainerNew0 = CoD.vhud_generic_button_layout.new( menu, controller )
	vhudmsButtonContainerNew0:setLeftRight( true, true, 0, 0 )
	vhudmsButtonContainerNew0:setTopBottom( true, true, 0, 0 )
	vhudmsButtonContainerNew0:linkToElementModel( self, "bindings", false, function ( model )
		vhudmsButtonContainerNew0:setModel( model, controller )
	end )
	vhudmsButtonContainerNew0:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		SizeToSafeArea( element, controller )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:addElement( vhudmsButtonContainerNew0 )
	self.vhudmsButtonContainerNew0 = vhudmsButtonContainerNew0
	
	local vhuddartTimebar = CoD.vhud_dart_Timebar.new( menu, controller )
	vhuddartTimebar:setLeftRight( false, true, -289.17, 60.83 )
	vhuddartTimebar:setTopBottom( true, false, 80.91, 89.91 )
	vhuddartTimebar:setAlpha( 0.7 )
	vhuddartTimebar:setYRot( -20 )
	vhuddartTimebar:linkToElementModel( self, nil, false, function ( model )
		vhuddartTimebar:setModel( model, controller )
	end )
	self:addElement( vhuddartTimebar )
	self.vhuddartTimebar = vhuddartTimebar
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhuddartreticle:close()
		element.vhuddartIris:close()
		element.VignetteContainer:close()
		element.vhudmsButtonContainerNew0:close()
		element.vhuddartTimebar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

