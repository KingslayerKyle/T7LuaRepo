-- dadea3869b25dd11a68e0d5d7e55f274
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Buttons.vhud_generic_button_layout" )
require( "ui.uieditor.widgets.VehicleHUDs.hcxd.vhud_hcxd_Timebar" )

LUI.createMenu.VHUD_HCXD = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VHUD_HCXD" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VHUD_HCXD.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local vignette = LUI.UIImage.new()
	vignette:setLeftRight( true, true, 0, 0 )
	vignette:setTopBottom( true, true, 0, 0 )
	vignette:setImage( RegisterImage( "uie_t7_hcxd_vignette_score_streak" ) )
	self:addElement( vignette )
	self.vignette = vignette
	
	local vignetteCenter = LUI.UIImage.new()
	vignetteCenter:setLeftRight( true, true, -202.5, 202.5 )
	vignetteCenter:setTopBottom( true, true, -117.91, 109.91 )
	vignetteCenter:setAlpha( 0.1 )
	vignetteCenter:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_backgroundtint" ) )
	self:addElement( vignetteCenter )
	self.vignetteCenter = vignetteCenter
	
	local vhudgenericbuttonlayout0 = CoD.vhud_generic_button_layout.new( f1_local1, controller )
	vhudgenericbuttonlayout0:setLeftRight( true, true, 0, 0 )
	vhudgenericbuttonlayout0:setTopBottom( true, true, 0, 0 )
	vhudgenericbuttonlayout0:subscribeToGlobalModel( controller, "PerController", "vehicle.bindings", function ( model )
		vhudgenericbuttonlayout0:setModel( model, controller )
	end )
	vhudgenericbuttonlayout0:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SizeToSafeArea( element, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( vhudgenericbuttonlayout0 )
	self.vhudgenericbuttonlayout0 = vhudgenericbuttonlayout0
	
	local vhudhcxdTimebar0 = CoD.vhud_hcxd_Timebar.new( f1_local1, controller )
	vhudhcxdTimebar0:setLeftRight( false, true, -293.52, -75.52 )
	vhudhcxdTimebar0:setTopBottom( true, false, 81.91, 90.91 )
	vhudhcxdTimebar0:setRGB( 0, 0, 0 )
	vhudhcxdTimebar0:setAlpha( 0.8 )
	vhudhcxdTimebar0:setYRot( -20 )
	vhudhcxdTimebar0:subscribeToGlobalModel( controller, "PerController", "vehicle", function ( model )
		vhudhcxdTimebar0:setModel( model, controller )
	end )
	self:addElement( vhudhcxdTimebar0 )
	self.vhudhcxdTimebar0 = vhudhcxdTimebar0
	
	local vhudhcxdTimebar = CoD.vhud_hcxd_Timebar.new( f1_local1, controller )
	vhudhcxdTimebar:setLeftRight( false, true, -293.52, -75.52 )
	vhudhcxdTimebar:setTopBottom( true, false, 81.91, 90.91 )
	vhudhcxdTimebar:setYRot( -20 )
	vhudhcxdTimebar:subscribeToGlobalModel( controller, "PerController", "vehicle", function ( model )
		vhudhcxdTimebar:setModel( model, controller )
	end )
	self:addElement( vhudhcxdTimebar )
	self.vhudhcxdTimebar = vhudhcxdTimebar
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudgenericbuttonlayout0:close()
		element.vhudhcxdTimebar0:close()
		element.vhudhcxdTimebar:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VHUD_HCXD.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

