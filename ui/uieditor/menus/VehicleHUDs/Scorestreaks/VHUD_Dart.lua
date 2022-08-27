-- 176729896371a8c94d8dcbfc852c5e53
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_internal" )

LUI.createMenu.VHUD_Dart = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "VHUD_Dart" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "VHUD_Dart.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local vhuddartinternal = CoD.vhud_dart_internal.new( f1_local1, controller )
	vhuddartinternal:setLeftRight( true, true, 0, 0 )
	vhuddartinternal:setTopBottom( true, true, 0, 0 )
	vhuddartinternal:subscribeToGlobalModel( controller, "PerController", "vehicle", function ( model )
		vhuddartinternal:setModel( model, controller )
	end )
	self:addElement( vhuddartinternal )
	self.vhuddartinternal = vhuddartinternal
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhuddartinternal:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "VHUD_Dart.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

