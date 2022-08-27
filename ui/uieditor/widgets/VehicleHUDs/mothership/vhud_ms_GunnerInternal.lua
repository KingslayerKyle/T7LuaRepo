-- ae73c8a6c07ee37b29123f404f7f939b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_Iris" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_ReticleGunner" )
require( "ui.uieditor.widgets.VehicleHUDs.Buttons.vhud_generic_button_layout" )

CoD.vhud_ms_GunnerInternal = InheritFrom( LUI.UIElement )
CoD.vhud_ms_GunnerInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_GunnerInternal )
	self.id = "vhud_ms_GunnerInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local VignetteContainer = CoD.VehicleGround_VignetteContainer.new( menu, controller )
	VignetteContainer:setLeftRight( true, true, 0, 0 )
	VignetteContainer:setTopBottom( true, true, 0, 0 )
	VignetteContainer:setAlpha( 0.1 )
	self:addElement( VignetteContainer )
	self.VignetteContainer = VignetteContainer
	
	local VehicleGroundIris = CoD.vhud_ms_Iris.new( menu, controller )
	VehicleGroundIris:setLeftRight( false, false, -640, 640 )
	VehicleGroundIris:setTopBottom( false, false, -360, 360 )
	VehicleGroundIris:setRGB( 1, 0.35, 0.35 )
	VehicleGroundIris:setAlpha( 0.8 )
	VehicleGroundIris:linkToElementModel( self, nil, false, function ( model )
		VehicleGroundIris:setModel( model, controller )
	end )
	VehicleGroundIris:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		PlayClipOnElement( self, {
			elementName = "VehicleGroundIris",
			clipName = "StartUp"
		}, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( VehicleGroundIris )
	self.VehicleGroundIris = VehicleGroundIris
	
	local dpsVehicleReticle = CoD.vhud_ms_ReticleGunner.new( menu, controller )
	dpsVehicleReticle:setLeftRight( true, true, 0, 0 )
	dpsVehicleReticle:setTopBottom( true, true, 0, 0 )
	dpsVehicleReticle:setRGB( 1, 0.59, 0.59 )
	dpsVehicleReticle:setAlpha( 0.38 )
	dpsVehicleReticle:linkToElementModel( self, nil, false, function ( model )
		dpsVehicleReticle:setModel( model, controller )
	end )
	dpsVehicleReticle:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		PlayClipOnElement( self, {
			elementName = "dpsVehicleReticle",
			clipName = "StartUp"
		}, controller )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	dpsVehicleReticle:mergeStateConditions( {
		{
			stateName = "Zoom",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "zoomed" )
			end
		}
	} )
	dpsVehicleReticle:linkToElementModel( dpsVehicleReticle, "zoomed", true, function ( model )
		menu:updateElementState( dpsVehicleReticle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zoomed"
		} )
	end )
	self:addElement( dpsVehicleReticle )
	self.dpsVehicleReticle = dpsVehicleReticle
	
	local vhudgenericbuttonlayout0 = CoD.vhud_generic_button_layout.new( menu, controller )
	vhudgenericbuttonlayout0:setLeftRight( true, true, 0, 0 )
	vhudgenericbuttonlayout0:setTopBottom( true, true, 0, 0 )
	vhudgenericbuttonlayout0:linkToElementModel( self, "bindings", false, function ( model )
		vhudgenericbuttonlayout0:setModel( model, controller )
	end )
	vhudgenericbuttonlayout0:registerEventHandler( "menu_loaded", function ( element, event )
		local f9_local0 = nil
		SizeToSafeArea( element, controller )
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	self:addElement( vhudgenericbuttonlayout0 )
	self.vhudgenericbuttonlayout0 = vhudgenericbuttonlayout0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				VignetteContainer:completeAnimation()
				self.VignetteContainer:setAlpha( 1 )
				self.clipFinished( VignetteContainer, {} )
				VehicleGroundIris:completeAnimation()
				self.VehicleGroundIris:setRGB( 1, 1, 1 )
				self.VehicleGroundIris:setAlpha( 1 )
				self.clipFinished( VehicleGroundIris, {} )
				dpsVehicleReticle:completeAnimation()
				self.dpsVehicleReticle:setRGB( 1, 1, 1 )
				self.dpsVehicleReticle:setAlpha( 1 )
				self.clipFinished( dpsVehicleReticle, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VignetteContainer:close()
		element.VehicleGroundIris:close()
		element.dpsVehicleReticle:close()
		element.vhudgenericbuttonlayout0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

