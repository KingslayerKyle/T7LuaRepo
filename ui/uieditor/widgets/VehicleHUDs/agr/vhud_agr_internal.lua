-- 4b4c88fcea935096d8e62b8b1a6ef267
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_reticle" )
require( "ui.uieditor.widgets.VehicleHUDs.Buttons.vhud_generic_button_layout" )

CoD.vhud_agr_internal = InheritFrom( LUI.UIElement )
CoD.vhud_agr_internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_agr_internal )
	self.id = "vhud_agr_internal"
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
	
	local Vignette = LUI.UIImage.new()
	Vignette:setLeftRight( true, true, 0, 0 )
	Vignette:setTopBottom( true, true, 0, 0 )
	Vignette:setAlpha( 0.85 )
	Vignette:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_textureoverlayvignette" ) )
	self:addElement( Vignette )
	self.Vignette = Vignette
	
	local vhudagrreticle = CoD.vhud_agr_reticle.new( menu, controller )
	vhudagrreticle:setLeftRight( true, true, 0, 0 )
	vhudagrreticle:setTopBottom( true, true, 0, 0 )
	vhudagrreticle:linkToElementModel( self, nil, false, function ( model )
		vhudagrreticle:setModel( model, controller )
	end )
	vhudagrreticle:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		PlayClipOnElement( self, {
			elementName = "vhudagrreticle",
			clipName = "StartUp"
		}, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	vhudagrreticle:mergeStateConditions( {
		{
			stateName = "Zoom",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "zoomed" )
			end
		}
	} )
	vhudagrreticle:linkToElementModel( vhudagrreticle, "zoomed", true, function ( model )
		menu:updateElementState( vhudagrreticle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zoomed"
		} )
	end )
	self:addElement( vhudagrreticle )
	self.vhudagrreticle = vhudagrreticle
	
	local vignetteRight = LUI.UIImage.new()
	vignetteRight:setLeftRight( false, true, -300, 0 )
	vignetteRight:setTopBottom( false, false, -360, 360 )
	vignetteRight:setAlpha( 0.2 )
	vignetteRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_vignette" ) )
	self:addElement( vignetteRight )
	self.vignetteRight = vignetteRight
	
	local vignetteLeft = LUI.UIImage.new()
	vignetteLeft:setLeftRight( true, false, 0, 300 )
	vignetteLeft:setTopBottom( false, false, -360, 360 )
	vignetteLeft:setAlpha( 0.2 )
	vignetteLeft:setYRot( -180 )
	vignetteLeft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_vignette" ) )
	self:addElement( vignetteLeft )
	self.vignetteLeft = vignetteLeft
	
	local vhudagrButtonContainer = CoD.vhud_generic_button_layout.new( menu, controller )
	vhudagrButtonContainer:setLeftRight( true, true, 0, 0 )
	vhudagrButtonContainer:setTopBottom( true, true, 0, 0 )
	vhudagrButtonContainer:linkToElementModel( self, "bindings", false, function ( model )
		vhudagrButtonContainer:setModel( model, controller )
	end )
	vhudagrButtonContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		SizeToSafeArea( element, controller )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( vhudagrButtonContainer )
	self.vhudagrButtonContainer = vhudagrButtonContainer
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudagrreticle:close()
		element.vhudagrButtonContainer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

